/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2019  Dino PH Leung
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:http/http.dart' show MultipartFile;

import 'model.dart';
import '../util/http_client.dart';

/// A class for communicating with Telegram API
///
/// You probably want to use its methods through [TeleDart], rather
/// than accessing them directly.
class Telegram {
  final String _baseUrl = 'api.telegram.org';
  final String _token;

  Telegram(this._token);

  /// Private function to construct Telegram API Uri
  Uri _apiUri(String unencodedPath, [Map<String, dynamic>? queryParameters]) =>
      Uri.https(_baseUrl, 'bot$_token/$unencodedPath', queryParameters);

  /// Use this method to receive incoming updates using long polling ([wiki])
  ///
  /// An Array of [Update] objects is returned.
  ///
  /// **Notes**
  /// 1. This method will not work if an outgoing webhook is set up.
  /// 2. In order to avoid getting duplicate updates, recalculate offset after each server response.
  ///
  /// https://core.telegram.org/bots/api#getupdates
  ///
  /// [wiki]: http://en.wikipedia.org/wiki/Push_technology#Long_polling
  Future<List<Update>> getUpdates(
      {int? offset,
      int? limit,
      int? timeout,
      List<String>? allowedUpdates}) async {
    var requestUrl = _apiUri('getUpdates', {
      'offset': ['$offset'],
      'limit': ['$limit'],
      'timeout': ['$timeout'],
      'allowed_updates': [jsonEncode(allowedUpdates)]
    });

    return (await HttpClient.httpGet(requestUrl).timeout(
            Duration(milliseconds: ((timeout ?? 0) * 1.1 * 1000).round())))
        .map<Update>((update) => Update.fromJson(update))
        .toList();
  }

  /// Use this method to specify a url and receive incoming updates via an outgoing webhook
  ///
  /// Whenever there is an update for the bot, we will send an HTTPS POST request to the
  /// specified url, containing a JSON-serialized [Update].
  /// In case of an unsuccessful request, we will give up after a reasonable amount of attempts.
  /// Returns *True* on success.
  /// If you'd like to make sure that the webhook was set by you, you can specify secret data in the parameter `secretToken`.
  /// If specified, the request will contain a header “X-Telegram-Bot-Api-Secret-Token” with the secret token as content.
  ///
  /// **Notes**
  /// 1. You will not be able to receive updates using [getUpdates] for as long as an outgoing webhook is set up.
  /// 2. To use a self-signed certificate, you need to upload your [public key certificate] using certificate parameter. Please upload as InputFile, sending a String will not work.
  /// 3. Ports currently supported for Webhooks: **443, 80, 88, 8443**.
  ///
  /// If you're having any trouble setting up webhooks, please check out this [amazing guide to Webhooks].
  ///
  /// https://core.telegram.org/bots/api#setwebhook
  ///
  /// [public key certificate]: https://core.telegram.org/bots/self-signed
  /// [amazing guide to Webhooks]: https://core.telegram.org/bots/webhooks
  Future<bool> setWebhook(String url,
      {String? ipAddress,
      io.File? certificate,
      int? maxConnections,
      List<String>? allowedUpdates,
      bool? dropPendingUpdates,
      String? secretToken}) async {
    var requestUrl = _apiUri('setWebhook');

    var body = <String, dynamic>{
      'url': url,
      'ip_address': ipAddress,
      'max_connections': maxConnections,
      'allowed_updates':
          allowedUpdates == null ? null : jsonEncode(allowedUpdates),
      'drop_pending_updates': dropPendingUpdates,
      'secret_token': secretToken,
    };
    if (certificate != null) {
      // filename cannot be empty to post to Telegram server
      var files = <MultipartFile>[];
      files.add(MultipartFile(
          'certificate', certificate.openRead(), certificate.lengthSync(),
          filename: '${certificate.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return await HttpClient.httpPost(requestUrl, body: body);
    }
  }

  /// Use this method to remove webhook integration if you decide to switch back to [getUpdates]
  ///
  /// Returns *True* on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#deletewebhook
  Future<bool> deleteWebhook({bool? dropPendingUpdates}) async {
    var requestUrl = _apiUri('deleteWebhook');
    var body = <String, dynamic>{'drop_pending_updates': dropPendingUpdates};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get current webhook status.
  /// Requires no parameters.
  ///
  /// On success, returns a [WebhookInfo] object.
  /// If the bot is using [getUpdates], will return an object with the *url* field empty.
  ///
  /// https://core.telegram.org/bots/api#getwebhookinfo
  Future<WebhookInfo> getWebhookInfo() async =>
      WebhookInfo.fromJson(await HttpClient.httpGet(_apiUri('getWebhookInfo')));

  /// A simple method for testing your bot's auth token.
  /// Requires no parameters.
  /// Returns basic information about the bot in form of a [User] object.
  ///
  /// https://core.telegram.org/bots/api#getme
  Future<User> getMe() async =>
      User.fromJson(await HttpClient.httpGet(_apiUri('getMe')));

  /// Use this method to log out from the cloud Bot API server before launching the bot locally
  ///
  /// You must log out the bot before running it locally,
  /// otherwise there is no guarantee that the bot will receive updates.
  /// After a successful call, you can immediately log in on a local server,
  /// but will not be able to log in back to the cloud Bot API server for 10 minutes.
  /// Returns True on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#logout
  Future<bool> logOut() async => await HttpClient.httpGet(_apiUri('logOut'));

  /// Use this method to close the bot instance before moving it from one local server to another
  ///
  /// You need to delete the webhook before calling this method to ensure that the bot isn't
  /// launched again after server restart.
  /// The method will return error 429 in the first 10 minutes after the bot is launched.
  /// Returns True on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#close
  Future<bool> close() async => await HttpClient.httpGet(_apiUri('close'));

  /// Use this method to send text messages. On success, the sent [Message] is returned.
  ///
  /// [**Formatting options**](https://core.telegram.org/bots/api#formatting-options)
  ///
  /// https://core.telegram.org/bots/api#sendmessage
  Future<Message> sendMessage(dynamic chatId, String text,
      {int? messageThreadId,
      String? parseMode,
      List<MessageEntity>? entities,
      bool? disableWebPagePreview,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendMessage');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'text': text,
      'parse_mode': parseMode,
      'entities': entities == null ? null : jsonEncode(entities),
      'disable_web_page_preview': disableWebPagePreview,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to forward messages of any kind. On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<Message> forwardMessage(dynamic chatId, int fromChatId, int messageId,
      {int? messageThreadId,
      bool? disableNotification,
      bool? protectContent}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('forwardMessage');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'from_chat_id': fromChatId,
      'message_id': messageId,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to copy messages of any kind
  ///
  /// The method is analogous to the method [forwardMessage],
  /// but the copied message doesn't have a link to the original message.
  /// Returns the [MessageId] of the sent message on success.
  ///
  /// https://core.telegram.org/bots/api#copyMessage
  Future<MessageId> copyMessage(dynamic chatId, int fromChatId, int messageId,
      {int? messageThreadId,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('copyMessage');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'from_chat_id': fromChatId,
      'message_id': messageId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup)
    };
    return MessageId.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send photos
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<Message> sendPhoto(dynamic chatId, dynamic photo,
      {int? messageThreadId,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      bool? hasSpoiler,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendPhoto');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'has_spoiler': hasSpoiler,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (photo is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(photo, 'photo'));
    } else if (photo is String) {
      body.addAll({'photo': photo});
    } else {
      return Future.error(TelegramException(
          'Attribute \'photo\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send audio files
  ///
  /// If you want Telegram clients to display them in the music player.
  /// Your audio must be in the .mp3 format. On success, the sent [Message] is returned.
  /// Bots can currently send audio files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// For sending voice messages, use the [sendVoice] method instead.
  ///
  /// https://core.telegram.org/bots/api#sendaudio
  Future<Message> sendAudio(dynamic chatId, dynamic audio,
      {int? messageThreadId,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      int? duration,
      String? performer,
      String? title,
      dynamic thumb,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendAudio');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'duration': duration,
      'performer': performer,
      'title': title,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (audio is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(audio, 'audio'));
    } else if (audio is String) {
      body.addAll({'audio': audio});
    } else {
      return Future.error(TelegramException(
          'Attribute \'audio\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send general files
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send files of any type of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// https://core.telegram.org/bots/api#senddocument
  Future<Message> sendDocument(dynamic chatId, dynamic document,
      {int? messageThreadId,
      dynamic thumb,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      bool? disableContentTypeDetection,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendDocument');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'disable_content_type_detection': disableContentTypeDetection,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (document is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(document, 'document'));
    } else if (document is String) {
      body.addAll({'document': document});
    } else {
      return Future.error(TelegramException(
          'Attribute \'document\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send video files
  ///
  /// Telegram clients support mp4 videos (other formats may be sent as [Document]).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send video files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// https://core.telegram.org/bots/api#sendvideo
  ///
  /// [Document]: https://core.telegram.org/bots/api#document
  Future<Message> sendVideo(dynamic chatId, dynamic video,
      {int? messageThreadId,
      int? duration,
      int? width,
      int? height,
      dynamic thumb,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      bool? hasSpoiler,
      bool? supportsStreaming,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVideo');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'duration': duration,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'has_spoiler': hasSpoiler,
      'supports_streaming': supportsStreaming,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (video is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(video, 'video'));
    } else if (video is String) {
      body.addAll({'video': video});
    } else {
      return Future.error(TelegramException(
          'Attribute \'video\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound)
  ///
  /// On success, the sent [Message] is returned.
  /// Bots can currently send animation files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// https://core.telegram.org/bots/api#sendanimation
  Future<Message> sendAnimation(dynamic chatId, dynamic animation,
      {int? messageThreadId,
      int? duration,
      int? width,
      int? height,
      dynamic thumb,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      bool? hasSpoiler,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendAnimation');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'duration': duration,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'has_spoiler': hasSpoiler,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (animation is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(animation, 'animation'));
    } else if (animation is String) {
      body.addAll({'animation': animation});
    } else {
      return Future.error(TelegramException(
          'Attribute \'animation\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send audio files
  ///
  /// If you want Telegram clients to display the file as a playable voice message.
  /// For this to work, your audio must be in an .ogg file encoded with OPUS
  /// (other formats may be sent as [Audio] or [Document]).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send voice messages of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  ///
  /// [Audio]: https://core.telegram.org/bots/api#audio
  /// [Document]: https://core.telegram.org/bots/api#document
  Future<Message> sendVoice(dynamic chatId, dynamic voice,
      {int? messageThreadId,
      String? caption,
      String? parseMode,
      List<MessageEntity>? captionEntities,
      int? duration,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVoice');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities':
          captionEntities == null ? null : jsonEncode(captionEntities),
      'duration': duration,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (voice is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(voice, 'voice'));
    } else if (voice is String) {
      body.addAll({'voice': voice});
    } else {
      return Future.error(TelegramException(
          'Attribute \'voice\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  /// Use this method to send video messages
  ///
  /// On success, the sent Message is returned.
  ///
  /// As of [v.4.0], Telegram clients support rounded square mp4 videos of up to 1 minute long.
  ///
  /// https://core.telegram.org/bots/api#sendvideonote
  ///
  /// [v.4.0]: https://telegram.org/blog/video-messages-and-telescope
  Future<Message> sendVideoNote(dynamic chatId, dynamic videoNote,
      {int? messageThreadId,
      int? duration,
      int? length,
      dynamic thumb,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVideoNote');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'duration': duration,
      'length': length,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (videoNote is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(videoNote, 'video_note'));
    } else if (videoNote is String) {
      body.addAll({'video_note': videoNote});
    } else {
      return Future.error(TelegramException(
          'Attribute \'videoNote\' can only be either io.File or String (Telegram fileId or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  // TODO: #9
  // ! media can only take fileId or url
  // * need to implement POST multipart/form-data uploading files
  // * or even mixed input
  /// Use this method to send a group of photos or videos as an album
  ///
  /// On success, an array of the sent [Message]s is returned.
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<List<Message>> sendMediaGroup(dynamic chatId, List<InputMedia> media,
      {int? messageThreadId,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendMediaGroup');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'media': jsonEncode(media),
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
    };
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<Message>((message) => Message.fromJson(message))
        .toList();
  }

  /// Use this method to send point on the map
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendlocation
  Future<Message> sendLocation(
      dynamic chatId, double latitude, double longitude,
      {int? messageThreadId,
      double? horizontalAccuracy,
      int? livePeriod,
      int? heading,
      int? proximityAlertRadius,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendLocation');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'latitude': latitude,
      'longitude': longitude,
      'horizontal_accuracy': horizontalAccuracy,
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to edit live location messages sent by the bot or via the bot
  /// (for [inline bots]).
  ///
  /// A location can be edited until its *livePeriod* expires or editing is explicitly disabled by a
  /// call to [stopMessageLiveLocation].
  /// On success, if the edited message was sent by the bot,
  /// the edited [Message] is returned, otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagelivelocation
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      double? horizontalAccuracy,
      int? heading,
      int? proximityAlertRadius,
      ReplyMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageLiveLocation');
    var body = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'horizontal_accuracy': horizontalAccuracy,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to stop updating a live location message sent by the bot or via the bot
  /// (for [inline bots]) before *livePeriod* expires.
  ///
  /// On success, if the message was sent by the bot, the sent [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> stopMessageLiveLocation(
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      ReplyMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('stopMessageLiveLocation');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send information about a venue
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<Message> sendVenue(dynamic chatId, double latitude, double longitude,
      String title, String address,
      {int? messageThreadId,
      String? foursquareId,
      String? foursquareType,
      String? googlePlaceId,
      String? googlePlaceType,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVenue');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquareId,
      'foursquare_type': foursquareType,
      'google_place_id': googlePlaceId,
      'google_place_type': googlePlaceType,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send phone contacts
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<Message> sendContact(
      dynamic chatId, String phoneNumber, String firstName,
      {int? messageThreadId,
      String? lastName,
      String? vcard,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendContact');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send a native poll
  ///
  /// A native poll can't be sent to a private chat.
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendpoll
  Future<Message> sendPoll(
      dynamic chatId, String question, List<String> options,
      {int? messageThreadId,
      bool? isAnonymous,
      String? type,
      bool? allowsMultipleAnswers,
      int? correctOptionId,
      String? explanation,
      String? explanationParseMode,
      List<MessageEntity>? explanationEntities,
      int? openPeriod,
      int? closeDate,
      bool? isClosed,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendPoll');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'question': question,
      'options': jsonEncode(options),
      'is_anonymous': isAnonymous,
      'type': type,
      'allows_multiple_answers': allowsMultipleAnswers,
      'correct_option_id': correctOptionId,
      'explanation': explanation,
      'explanation_parse_mode': explanationParseMode,
      'explanation_entities':
          explanationEntities == null ? null : jsonEncode(explanationEntities),
      'open_period': openPeriod,
      'close_date': closeDate,
      'is_closed': isClosed,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send an animated emoji that will display a random value
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendDice(dynamic chatId,
      {int? messageThreadId,
      String emoji = Dice.emojiDice,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendDice');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'emoji': emoji,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method when you need to tell the user that something is happening on the bot's side
  ///
  /// The status is set for 5 seconds or less
  /// (when a message arrives from your bot, Telegram clients clear its typing status).
  /// Returns *True* on success.
  ///
  /// Example: The [ImageBot] needs some time to process a request and upload the image.
  /// Instead of sending a text message along the lines of “Retrieving image, please wait…”,
  /// the bot may use [sendChatAction] with action = uploadPhoto.
  /// The user will see a “sending photo” status for the bot.
  ///
  /// We only recommend using this method when a response from the bot will take a **noticeable**
  /// amount of time to arrive.
  ///
  /// https://core.telegram.org/bots/api#sendchataction
  ///
  /// [ImageBot]: https://t.me/imagebot
  Future<bool> sendChatAction(dynamic chatId, String action,
      {int? messageThreadId}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendChatAction');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'action': action
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get a list of profile pictures for a user
  ///
  /// Returns a [UserProfilePhotos] object.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<UserProfilePhotos> getUserProfilePhotos(int userId,
      {int? offset, int? limit}) async {
    var requestUrl = _apiUri('getUserProfilePhotos');
    var body = <String, dynamic>{
      'user_id': userId,
      'offset': offset,
      'limit': limit,
    };
    return UserProfilePhotos.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to get basic info about a file and prepare it for downloading
  ///
  /// For the moment, bots can download files of up to 20MB in size. On success,
  /// a [File] object is returned. The file can then be downloaded via the link
  /// `https://api.telegram.org/file/bot<token>/<file_path>`,
  /// where `<file_path>` is taken from the response.
  /// It is guaranteed that the link will be valid for at least 1 hour.
  /// When the link expires, a one can be requested by calling [getFile] again.
  ///
  /// **Note:** This function may not preserve the original file name and MIME type.
  /// You should save the file's MIME type and name (if available) when the File object is received.
  ///
  /// https://core.telegram.org/bots/api#getfile
  Future<File> getFile(String fileId) async {
    var requestUrl = _apiUri('getFile');
    var body = <String, dynamic>{'file_id': fileId};
    return File.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to ban a user in a group, a supergroup or a channel
  ///
  /// In the case of supergroups and channels,
  /// the user will not be able to return to the group on their own using invite links, etc.,
  /// unless [unbanned] first.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate admin rights.
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#banchatmember
  ///
  /// [unbanned]: https://core.telegram.org/bots/api#unbanchatmember
  Future<bool> banChatMember(dynamic chatId, int userId,
      {int? untilDate, bool? revokeMessages}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('banChatMember');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
      'until_date': untilDate,
      'revoke_messages': revokeMessages,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to unban a previously kicked user in a supergroup or channel
  ///
  /// The user will **not** return to the group or channel automatically,
  /// but will be able to join via link, etc. The bot must be an administrator for this to work.
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<bool> unbanChatMember(dynamic chatId, int userId,
      {bool? onlyIfBanned}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unbanChatMember');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
      'only_if_banned': onlyIfBanned,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to restrict a user in a supergroup
  ///
  /// The bot must be an administrator in the supergroup for this to work and must have the
  /// appropriate admin rights.
  /// Pass *True* for all boolean parameters to lift restrictions from a user.
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  ///
  /// This method now takes the new user permissions in a single argument of the type *ChatPermissions*.
  /// The old way of passing parameters will keep working for a while for backward compatibility.
  Future<bool> restrictChatMember(
      dynamic chatId, int userId, ChatPermissions permissions,
      {bool? useIndependentChatPermissions, int? untilDate}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('restrictChatMember');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
      'permissions': jsonEncode(permissions),
      'use_independent_chat_permissions': useIndependentChatPermissions,
      'until_date': untilDate,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to promote or demote a user in a supergroup or a channel
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  /// Pass *False* for all boolean parameters to demote a user. Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#promotechatmember
  Future<bool> promoteChatMember(dynamic chatId, int userId,
      {bool? isAnonymous,
      bool? canManageChat,
      bool? canPostMessages,
      bool? canEditMessages,
      bool? canDeleteMessages,
      bool? canManageVideoChats,
      bool? canRestrictMembers,
      bool? canPromoteMembers,
      bool? canChangeInfo,
      bool? canInviteUsers,
      bool? canPinMessages,
      bool? canManageTopics}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('promoteChatMember');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
      'is_anonymous': isAnonymous,
      'can_manage_chat': canManageChat,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_delete_messages': canDeleteMessages,
      'can_manage_video_chats': canManageVideoChats,
      'can_restrict_members': canRestrictMembers,
      'can_promote_members': canPromoteMembers,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_pin_messages': canPinMessages,
      'can_manage_topics': canManageTopics,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatadministratorcustomtitle
  Future<bool> setChatAdministratorCustomTitle(
      dynamic chatId, int userId, String customTitle) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatAdministratorCustomTitle');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
      'custom_title': customTitle,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to ban a channel chat in a supergroup or a channel
  ///
  /// Until the chat is unbanned, the owner of the banned chat won't be able to send messages on
  /// behalf of any of their channels. The bot must be an administrator in the supergroup or
  /// channel for this to work and must have the appropriate administrator rights.
  ///
  /// Returns *True* on success.
  Future<bool> banChatSenderChat(dynamic chatId, int senderChatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('banChatSenderChat');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'sender_chat_id': senderChatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to unban a previously banned channel chat in a supergroup or channel
  ///
  /// The bot must be an administrator for this to work and must have the appropriate administrator rights.
  ///
  /// Returns *True* on success.
  Future<bool> unbanChatSenderChat(dynamic chatId, int senderChatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unbanChatSenderChat');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'sender_chat_id': senderChatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set default chat permissions for all members
  ///
  /// The bot must be an administrator in the group or a supergroup for this to work
  /// and must have the canRestrictMembers admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> setChatPermissions(
      dynamic chatId, ChatPermissions permissions, {bool? useIndependentChatPermissions}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatPermissions');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'permissions': jsonEncode(permissions),
      'use_independent_chat_permissions': useIndependentChatPermissions,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to generate a invite link for a chat
  ///
  /// Any previously generated link is revoked.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  ///
  /// Returns the invite link as [String] on success.
  ///
  /// https://core.telegram.org/bots/api#exportchatinvitelink
  Future<String> exportChatInviteLink(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('exportChatInviteLink');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to create an additional invite link for a chat
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate admin rights.
  /// The link can be revoked using the method [revokeChatInviteLink].
  ///
  /// Returns the new invite link as [ChatInviteLink] object.
  ///
  /// https://core.telegram.org/bots/api#createchatinvitelink
  Future<ChatInviteLink> createChatInviteLink(dynamic chatId,
      {String? name,
      int? expireDate,
      int? memberLimit,
      bool? createsJoinRequest}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('createChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'name': name,
      'expire_date': expireDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    };
    return ChatInviteLink.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to edit a non-primary invite link created by the bot
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate admin rights.
  ///
  /// Returns the edited invite link as a [ChatInviteLink] object.
  ///
  /// https://core.telegram.org/bots/api#editchatinvitelink
  Future<ChatInviteLink> editChatInviteLink(dynamic chatId, String inviteLink,
      {String? name,
      int? expireDate,
      int? memberLimit,
      bool? createsJoinRequest}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'invite_link': inviteLink,
      'name': name,
      'expire_date': expireDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    };
    return ChatInviteLink.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to revoke an invite link created by the bot
  ///
  /// If the primary link is revoked, a new link is automatically generated.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate admin rights.
  ///
  /// Returns the revoked invite link as [ChatInviteLink] object.
  ///
  /// https://core.telegram.org/bots/api#revokechatinvitelink
  Future<ChatInviteLink> revokeChatInviteLink(
      dynamic chatId, String inviteLink) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('revokeChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'invite_link': inviteLink,
    };
    return ChatInviteLink.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to approve a chat join request
  ///
  /// The bot must be an administrator in the chat for this to work and must have the *canInviteUsers* administrator right.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#approvechatjoinrequest
  Future<bool> approveChatJoinRequest(dynamic chatId, int userId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('approveChatJoinRequest');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to decline a chat join request
  ///
  /// The bot must be an administrator in the chat for this to work and must have the *canInviteUsers* administrator right.
  ///
  /// Returns *True* on success.
  Future<bool> declineChatJoinRequest(dynamic chatId, int userId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('declineChatJoinRequest');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set a profile photo for the chat
  ///
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// Note: In regular groups (non-supergroups),
  /// this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
  ///
  /// https://core.telegram.org/bots/api#setchatphoto
  Future<bool> setChatPhoto(dynamic chatId, io.File photo) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatPhoto');
    var body = <String, dynamic>{'chat_id': chatId};
    // filename cannot be empty to post to Telegram server
    var files = List<MultipartFile>.filled(
        1,
        MultipartFile('photo', photo.openRead(), photo.lengthSync(),
            filename: '${photo.lengthSync()}'));
    return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
  }

  /// Use this method to delete a chat photo
  ///
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// Note: In regular groups (non-supergroups),
  /// this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<bool> deleteChatPhoto(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteChatPhoto');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to change the title of a chat
  ///
  /// Titles can't be changed for private chats.
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// Note: In regular groups (non-supergroups),
  /// this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<bool> setChatTitle(dynamic chatId, String title) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatTitle');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'title': title,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to change the description of a supergroup or a channel
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<bool> setChatDescription(dynamic chatId, {String? description}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatDescription');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'description': description,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to pin a message in a supergroup or a channel
  ///
  /// The bot must be an administrator in the chat for this to work and must have the
  /// ‘canPinMessages’ admin right in the supergroup or ‘canEditMessages’ admin right
  /// in the channel.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<bool> pinChatMessage(dynamic chatId, int messageId,
      {bool? disableNotification}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('pinChatMessage');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'disable_notification': disableNotification,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to remove a message from the list of pinned messages in a chat
  ///
  /// If the chat is not a private chat, the bot must be an administrator in the chat for
  /// this to work and must have the 'canPinMessages' admin right in a supergroup or
  /// 'canEditMessages' admin right in a channel.
  ///
  /// Returns *True* on success.
  ///
  /// If `messageId` not specified, the most recent pinned message (by sending date) will be unpinned.
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<bool> unpinChatMessage(dynamic chatId, {int? messageId}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unpinChatMessage');
    var body = <String, dynamic>{'chat_id': chatId, 'message_id': messageId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to clear the list of pinned messages in a chat
  ///
  /// If the chat is not a private chat, the bot must be an administrator in the chat for
  /// this to work and must have the 'canPinMessages' admin right in a supergroup or
  /// 'canEditMessages' admin right in a channel.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#unpinallchatmessages
  Future<bool> unpinAllChatMessages(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unpinAllChatMessages');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method for your bot to leave a group, supergroup or channel
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<bool> leaveChat(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('leaveChat');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get up to date information about the chat
  /// (current name of the user for one-on-one conversations,
  /// current username of a user, group or channel, etc.).
  ///
  /// Returns a [Chat] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<Chat> getChat(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChat');
    var body = <String, dynamic>{'chat_id': chatId};
    return Chat.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to get a list of administrators in a chat
  ///
  /// On success, returns an Array of [ChatMember] objects that contains information about all chat
  /// administrators except other bots.
  /// If the chat is a group or a supergroup and no administrators were appointed,
  /// only the creator will be returned.
  ///
  /// https://core.telegram.org/bots/api#getchatadministrators
  Future<List<ChatMember>> getChatAdministrators(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatAdministrators');
    var body = <String, dynamic>{'chat_id': chatId};
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// Use this method to get the number of members in a chat
  ///
  /// Returns [int] on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmembercount
  Future<int> getChatMemberCount(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatMemberCount');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get information about a member of a chat
  ///
  /// Returns a [ChatMember] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<ChatMember> getChatMember(dynamic chatId, int userId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatMember');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'user_id': userId,
    };
    return ChatMember.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to set a group sticker set for a supergroup
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  /// Use the field *canSetStickerSet* optionally returned in [getChat] requests to check if the
  /// bot can use this method.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<bool> setChatStickerSet(dynamic chatId, String stickerSetName) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatStickerSet');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'sticker_set_name': stickerSetName,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to delete a group sticker set from a supergroup
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  /// Use the field *canSetStickerSet* optionally returned in [getChat] requests to check if the
  /// bot can use this method.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<bool> deleteChatStickerSet(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteChatStickerSet');
    var body = <String, dynamic>{'chat_id': chatId};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  ///Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user.
  ///
  ///Requires no parameters.
  ///
  ///Returns an Array of [Sticker] objects.
  ///
  ///https://core.telegram.org/bots/api#getforumtopiciconstickers
  Future<List<Sticker>> getForumTopicIconStickers() async {
    var requestUrl = _apiUri('getForumTopicIconStickers');
    return (await HttpClient.httpPost(requestUrl))
        .map<Sticker>((sticker) => Sticker.fromJson(sticker))
        .toList();
  }

  /// Use this method to create a topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.
  ///
  /// Returns information about the created topic as a [ForumTopic] object.
  ///
  /// https://core.telegram.org/bots/api#createforumtopic
  Future<ForumTopic> createForumTopic(dynamic chatId, String name,
      {int? iconColor, String? iconCustomEmojiId}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('createForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'name': name,
      'icon_color': iconColor,
      'icon_custom_emoji_id': iconCustomEmojiId,
    };
    return ForumTopic.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  ///Use this method to edit name and icon of a topic in a forum supergroup chat.
  ///
  ///The bot must be an administrator in the chat for this to work and must have `canManageTopics` administrator rights, unless it is the creator of the topic.
  ///
  ///Returns *True* on success.
  ///
  ///https://core.telegram.org/bots/api#editforumtopic
  Future<bool> editForumTopic(dynamic chatId, String messageThreadId,
      String name, String iconCustomEmojiId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'name': name,
      'icon_custom_emoji_id': iconCustomEmojiId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to close an open topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights, unless it is the creator of the topic.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#closeforumtopic
  Future<bool> closeForumTopic(dynamic chatId, String messageThreadId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('closeForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to reopen a closed topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights, unless it is the creator of the topic.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#reopenforumtopic
  Future<bool> reopenForumTopic(dynamic chatId, String messageThreadId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('reopenForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_threadId': messageThreadId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to delete a forum topic along with all its messages in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canDeleteMessages` administrator rights.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deleteforumtopic
  Future<bool> deleteForumTopic(dynamic chatId, String messageThreadId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to clear the list of pinned messages in a forum topic.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canPinMessages` administrator right in the supergroup.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#unpinallforumtopicmessages
  Future<bool> unpinAllForumTopicMessages(
      dynamic chatId, String messageThreadId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unpinAllForumTopicMessages');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to edit the name of the 'General' topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have `canManageTopics` administrator rights.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#editgeneralforumtopic
  Future<bool> editGeneralForumTopic(dynamic chatId, String name) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editGeneralForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'name': name,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to close an open 'General' topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights.
  ///
  /// Returns *True* on success.
  ///
  ///https://core.telegram.org/bots/api#closegeneralforumtopic
  Future<bool> closeGeneralForumTopic(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('closeGeneralForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to reopen a closed 'General' topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights.
  /// The topic will be automatically unhidden if it was hidden.
  ///
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#reopengeneralforumtopic
  Future<bool> reopenGeneralForumTopic(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('reopenGeneralForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to hide the 'General' topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights.
  /// The topic will be automatically closed if it was open.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#hidegeneralforumtopic
  Future<bool> hideGeneralForumTopic(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('hideGeneralForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to unhide the 'General' topic in a forum supergroup chat.
  ///
  /// The bot must be an administrator in the chat for this to work and must have the `canManageTopics` administrator rights
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#unhidegeneralforumtopic
  Future<bool> unhideGeneralForumTopic(dynamic chatId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unhideGeneralForumTopic');
    var body = <String, dynamic>{
      'chat_id': chatId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send answers to callback queries sent from [inline keyboards]
  ///
  /// The answer will be displayed to the user as a notification at the top of the chat screen or as
  /// an alert.
  ///
  /// On success, *True* is returned.
  ///
  /// Alternatively, the user can be redirected to the specified Game URL.
  /// For this option to work, you must first create a game for your bot via [@Botfather]
  /// and accept the terms. Otherwise, you may use links like `t.me/your_bot?start=XXXX`
  /// that open your bot with a parameter.
  ///
  /// https://core.telegram.org/bots/api#answercallbackquery
  ///
  /// [inline keyboards]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  /// [@Botfather]: https://t.me/botfather
  Future<bool> answerCallbackQuery(String callbackQueryId,
      {String? text, bool? showAlert, String? url, int? cacheTime}) async {
    var requestUrl = _apiUri('answerCallbackQuery');
    var body = <String, dynamic>{
      'callback_query_id': callbackQueryId,
      'text': text,
      'show_alert': showAlert,
      'url': url,
      'cache_time': cacheTime,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to change the list of the bot's commands
  ///
  /// See https://core.telegram.org/bots#commands for more details about bot commands.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setmycommands
  Future<bool> setMyCommands(List<BotCommand> commands,
      {BotCommandScope? scope, String? languageCode}) async {
    var requestUrl = _apiUri('setMyCommands');
    var body = <String, dynamic>{
      'commands': jsonEncode(commands),
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': languageCode,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to delete the list of the bot's commands for the given scope and user language
  ///
  /// After deletion, [higher level commands] will be shown to affected users.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletemycommands
  ///
  /// [higher level commands]: https://core.telegram.org/bots/api#determining-list-of-commands
  Future<bool> deleteMyCommands(
      {BotCommandScope? scope, String? languageCode}) async {
    var requestUrl = _apiUri('deleteMyCommands');
    var body = <String, dynamic>{
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': languageCode,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get the current list of the bot's commands for the given scope and user language
  ///
  /// Returns Array of [BotCommand] on success.
  /// If commands aren't set, an empty list is returned.
  ///
  /// https://core.telegram.org/bots/api#getmycommands
  Future<List<BotCommand>> getMyCommands(
      {BotCommandScope? scope, String? languageCode}) async {
    var requestUrl = _apiUri('getMyCommands');
    var body = <String, dynamic>{
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': languageCode,
    };
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<BotCommand>((botCommand) => BotCommand.fromJson(botCommand))
        .toList();
  }

  /// Use this method to change the bot's menu button in a private chat, or the default menu button.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatmenubutton
  Future<bool> setChatMenuButton(int? chatId, MenuButton? menuButton) async {
    var requestUrl = _apiUri('setChatMenuButton');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'menu_button': jsonEncode(menuButton),
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get the current value of the bot's menu button in a private chat, or the default menu button.
  ///
  /// Returns [MenuButton] on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmenubutton
  Future<MenuButton> getChatMenuButton(int? chatId) async {
    var requestUrl = _apiUri('getChatMenuButton');
    var body = <String, dynamic>{
      'chat_id': chatId,
    };
    return MenuButton.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels.
  /// These rights will be suggested to users, but they are are free to modify the list before adding the bot.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setmydefaultadministratorrights
  Future<bool> setMyDefaultAdministratorRights(
      ChatAdministratorRights? rights, bool? forChannels) async {
    var requestUrl = _apiUri('setMyDefaultAdministratorRights');
    var body = <String, dynamic>{
      'rights': rights == null ? null : jsonEncode(rights),
      'for_channels': forChannels,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get the current default administrator rights of the bot.
  ///
  /// Returns [ChatAdministratorRights] on success.
  ///
  /// https://core.telegram.org/bots/api#getmydefaultadministratorrights
  Future<ChatAdministratorRights> getMyDefaultAdministratorRights(
      bool? forChannels) async {
    var requestUrl = _apiUri('getMyDefaultAdministratorRights');
    var body = <String, dynamic>{
      'for_channels': forChannels,
    };
    return ChatAdministratorRights.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to edit text and [Game] messages sent by the bot or via the bot
  /// (for [inline bots]).
  ///
  /// On success, if edited message is sent by the bot, the edited [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> editMessageText(String text,
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      String? parseMode,
      bool? disableWebPagePreview,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageText');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'text': text,
      'parse_mode': parseMode,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    var res = await HttpClient.httpPost(requestUrl, body: body);
    if (res == true) {
      return Future.error(
          TelegramException('Edited message is NOT sent by the bot'));
    } else {
      return Message.fromJson(res);
    }
  }

  /// Use this method to edit captions of messages sent by the bot or via the bot
  /// (for [inline bots]).
  ///
  /// On success, if edited message is sent by the bot, the edited [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagecaption
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> editMessageCaption(
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      String? caption,
      String? parseMode,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageCaption');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'caption': caption,
      'parse_mode': parseMode,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    var res = await HttpClient.httpPost(requestUrl, body: body);
    if (res == true) {
      return Future.error(
          TelegramException('Edited message is NOT sent by the bot'));
    } else {
      return Message.fromJson(res);
    }
  }

  /// Use this method to edit audio, document, photo, or video messages
  ///
  /// If a message is a part of a message album, then it can be edited only to a photo or a video.
  /// Otherwise, message type can be changed arbitrarily.
  /// When inline message is edited, file can't be uploaded.
  /// Use previously uploaded file via its fileId or specify a URL.
  ///
  /// On success, if the edited message was sent by the bot, the edited [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editMessageMedia
  Future<Message> editMessageMedia(
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      InputMedia? media,
      String? parseMode,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageMedia');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'media': media == null ? null : jsonEncode(media),
      'parse_mode': parseMode,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    var res = await HttpClient.httpPost(requestUrl, body: body);
    if (res == true) {
      return Future.error(
          TelegramException('Edited message is NOT sent by the bot'));
    } else {
      return Message.fromJson(res);
    }
  }

  /// Use this method to edit only the reply markup of messages sent by the bot or via the bot
  /// (for [inline bots]).
  ///
  /// On success, if edited message is sent by the bot, the edited [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagereplymarkup
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> editMessageReplyMarkup(
      {dynamic chatId,
      int? messageId,
      String? inlineMessageId,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageReplyMarkup');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    var res = await HttpClient.httpPost(requestUrl, body: body);
    if (res == true) {
      return Future.error(
          TelegramException('Edited message is NOT sent by the bot'));
    } else {
      return Message.fromJson(res);
    }
  }

  /// Use this method to stop a poll which was sent by the bot
  ///
  /// On success, the stopped [Poll] with the final results is returned.
  ///
  /// https://core.telegram.org/bots/api#stoppoll
  Future<Poll> stopPoll(
      dynamic chatId, int messageId, InlineKeyboardMarkup replyMarkup) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('stopPoll');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup,
    };
    return Poll.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to delete a message, including service messages
  ///
  /// It has the following limitations:
  /// * A message can only be deleted if it was sent less than 48 hours ago.
  /// * Bots can delete outgoing messages in groups and supergroups.
  /// * Bots can delete incoming messages in private chats.
  /// * Bots granted canPostMessages permissions can delete outgoing messages in channels.
  /// * If the bot is an administrator of a group, it can delete any message there.
  /// * If the bot has canDeleteMessages permission in a supergroup or a channel, it can delete any message there.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<bool> deleteMessage(dynamic chatId, int messageId) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteMessage');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_id': messageId,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send .webp stickers
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<Message> sendSticker(dynamic chatId, dynamic sticker,
      {int? messageThreadId,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendSticker');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };

    if (sticker is io.File) {
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile('sticker', sticker.openRead(), sticker.lengthSync(),
              filename: '${sticker.lengthSync()}'));
      return Message.fromJson(
          await HttpClient.httpMultipartPost(requestUrl, files, body: body));
    } else if (sticker is String) {
      body.addAll({'sticker': sticker});
      return Message.fromJson(
          await HttpClient.httpPost(requestUrl, body: body));
    } else {
      return Future.error(TelegramException(
          'Attribute \'sticker\' can only be either io.File or String (Telegram fileId or image url)'));
    }
  }

  /// Use this method to get a sticker set
  ///
  /// On success, a [StickerSet] object is returned.
  ///
  /// https://core.telegram.org/bots/api#getstickerset
  Future<StickerSet> getStickerSet(String name) async {
    var requestUrl = _apiUri('getStickerSet');
    var body = <String, dynamic>{'name': name};
    return StickerSet.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to get information about custom emoji stickers by their identifiers.
  ///
  /// Returns an Array of [Sticker] objects.
  ///
  /// https://core.telegram.org/bots/api#getcustomemojistickers
  Future<List<Sticker>> getCustomEmojiStickers(
      List<String> customEmojiIds) async {
    var requestUrl = _apiUri('getCustomEmojiStickers');
    var body = <String, dynamic>{
      'custom_emoji_ids': jsonEncode(customEmojiIds)
    };
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<Sticker>((sticker) => Sticker.fromJson(sticker))
        .toList();
  }

  /// Use this method to upload a .png file with a sticker for later use in
  /// *createNewStickerSet* and *addStickerToSet* methods (can be used multiple times)
  ///
  /// Returns the uploaded [File] on success.
  ///
  /// https://core.telegram.org/bots/api#uploadstickerfile
  Future<File> uploadStickerFile(int userId, io.File pngSticker) async {
    var requestUrl = _apiUri('uploadStickerFile');
    var body = <String, dynamic>{'user_id': userId};
    // filename cannot be empty to post to Telegram server
    var files = List<MultipartFile>.filled(
        1,
        MultipartFile(
            'png_sticker', pngSticker.openRead(), pngSticker.lengthSync(),
            filename: '${pngSticker.lengthSync()}'));
    return File.fromJson(
        await HttpClient.httpMultipartPost(requestUrl, files, body: body));
  }

  /// Use this method to create sticker set owned by a user
  ///
  /// The bot will be able to edit the created sticker set.
  /// You **must** use exactly one of the *fields pngSticker*, *tgsSticker*, or *webmSticker*.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<bool> createNewStickerSet(
      int userId, String name, String title, String emojis,
      {dynamic pngSticker,
      io.File? tgsSticker,
      io.File? webmSticker,
      String? stickerType,
      MaskPosition? maskPosition}) async {
    var requestUrl = _apiUri('createNewStickerSet');
    var botInfo = await getMe();
    var body = <String, dynamic>{
      'user_id': userId,
      'name': '${name}_by_${botInfo.username}',
      'title': title,
      'emojis': emojis,
      'sticker_type': stickerType,
      'mask_position': maskPosition == null ? null : jsonEncode(maskPosition),
    };

    if (pngSticker == null && tgsSticker == null && webmSticker == null) {
      return Future.error(TelegramException(
          'You must use exactly one of the fields `pngSticker`, `tgsSticker` or `webmSticker`.'));
    } else if (pngSticker is String) {
      body.addAll({'png_sticker': pngSticker});
      return await HttpClient.httpPost(requestUrl, body: body);
    } else if (pngSticker is io.File ||
        tgsSticker != null ||
        webmSticker != null) {
      var file = pngSticker ?? tgsSticker ?? webmSticker;
      var fieldName = pngSticker != null
          ? 'png_sticker'
          : tgsSticker != null
              ? 'tgs_sticker'
              : 'webm_sticker';
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile(fieldName, file.openRead(), file.lengthSync(),
              filename: '${file.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return Future.error(TelegramException(
          'Attribute \'pngSticker\' can only be either io.File or String (Telegram fileId or image url)'));
    }
  }

  /// Use this method to add a new sticker to a set created by the bot
  ///
  /// You **must** use exactly one of the fields *png_sticker*, *tgs_sticker*, or *webm_sticker*.
  /// Animated stickers can be added to animated sticker sets and only to them.
  /// Animated sticker sets can have up to 50 stickers.
  /// Static sticker sets can have up to 120 stickers.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<bool> addStickerToSet(int userId, String name, String emojis,
      {dynamic pngSticker,
      io.File? tgsSticker,
      io.File? webmSticker,
      MaskPosition? maskPosition}) async {
    var requestUrl = _apiUri('addStickerToSet');
    var body = <String, dynamic>{
      'user_id': userId,
      'name': name,
      'emojis': emojis,
      'mask_position': maskPosition == null ? null : jsonEncode(maskPosition),
    };

    if (pngSticker == null && tgsSticker == null && webmSticker == null) {
      return Future.error(TelegramException(
          'You must use exactly one of the fields `pngSticker`, `tgsSticker` or `webmSticker`.'));
    } else if (pngSticker is String) {
      body.addAll({'png_sticker': pngSticker});
      return await HttpClient.httpPost(requestUrl, body: body);
    } else if (pngSticker is io.File ||
        tgsSticker != null ||
        webmSticker != null) {
      var file = pngSticker ?? tgsSticker ?? webmSticker;
      var fieldName = pngSticker != null
          ? 'png_sticker'
          : tgsSticker != null
              ? 'tgs_sticker'
              : 'webm_sticker';
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile(fieldName, file.openRead(), file.lengthSync(),
              filename: '${file.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return Future.error(TelegramException(
          'Attribute \'pngSticker\' can only be either io.File or String (Telegram fileId or image url)'));
    }
  }

  /// Use this method to move a sticker in a set created by the bot to a specific position
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<bool> setStickerPositionInSet(String sticker, int position) async {
    var requestUrl = _apiUri('setStickerPositionInSet');
    var body = <String, dynamic>{
      'sticker': sticker,
      'position': position,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to delete a sticker from a set created by the bot
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<bool> deleteStickerFromSet(String sticker) async {
    var requestUrl = _apiUri('deleteStickerFromSet');
    var body = <String, dynamic>{'sticker': sticker};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set the thumbnail of a sticker set
  ///
  /// Animated thumbnails can be set for animated sticker sets only.
  ///
  /// Returns *True* on success.
  Future<bool> setStickerSetThumb(String name, int userId,
      {dynamic thumb}) async {
    var requestUrl = _apiUri('setStickerSetThumb');
    var body = <String, dynamic>{
      'name': name,
      'user_id': userId,
    };
    if (thumb == null) {
      return await HttpClient.httpPost(requestUrl, body: body);
    } else if (thumb is io.File) {
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile('thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else if (thumb is String) {
      body.addAll({'thumb': thumb});
      return await HttpClient.httpPost(requestUrl, body: body);
    } else {
      return Future.error(TelegramException(
          'Attribute \'thumb\' can only be either io.File or String (Telegram fileId or image url)'));
    }
  }

  /// Use this method to send answers to an inline query
  ///
  /// On success, *True* is returned.
  ///
  /// No more than **50** results per query are allowed.
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<bool> answerInlineQuery(
      String inlineQueryId, List<InlineQueryResult> results,
      {int? cacheTime,
      bool? isPersonal,
      String? nextOffset,
      String? switchPmText,
      String? switchPmParameter}) async {
    var requestUrl = _apiUri('answerInlineQuery');
    var body = <String, dynamic>{
      'inline_query_id': inlineQueryId,
      'results': jsonEncode(results),
      'cache_time': cacheTime,
      'is_personal': isPersonal,
      'next_offset': nextOffset,
      'switch_pm_text': switchPmText,
      'switch_pm_parameter': switchPmParameter,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set the result of an interaction with a [Web App] and send a corresponding
  /// message on behalf of the user to the chat from which the query originated.
  ///
  /// On success, a [SentWebAppMessage] object is returned.
  ///
  /// https://core.telegram.org/bots/api#answerwebappquery
  Future<SentWebAppMessage> answerWebAppQuery(
      String webAppQueryId, InlineQueryResult result) async {
    var requestUrl = _apiUri('answerWebAppQuery');
    var body = <String, dynamic>{
      'web_app_query_id': webAppQueryId,
      'result': jsonEncode(result),
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send invoices
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<Message> sendInvoice(
      dynamic chatId,
      String title,
      String description,
      String payload,
      String providerToken,
      String currency,
      List<LabeledPrice> prices,
      {int? messageThreadId,
      int? maxTipAmount,
      List<int>? suggestedTipAmounts,
      String? startParameter,
      String? providerData,
      String? photoUrl,
      int? photoSize,
      int? photoWidth,
      int? photoHeight,
      bool? needName,
      bool? needPhoneNumber,
      bool? needEmail,
      bool? needShippingAddress,
      bool? sendPhoneNumberToProvider,
      bool? sendEmailToProvider,
      bool? isFlexible,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendInvoice');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'currency': currency,
      'prices': jsonEncode(prices),
      'max_tip_amount': maxTipAmount,
      'suggested_tip_amounts':
          suggestedTipAmounts == null ? null : jsonEncode(suggestedTipAmounts),
      'start_parameter': startParameter,
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'need_name': needName,
      'need_phone_number': needPhoneNumber,
      'need_email': needEmail,
      'need_shipping_address': needShippingAddress,
      'send_phone_number_to_provider': sendPhoneNumberToProvider,
      'send_email_to_provider': sendEmailToProvider,
      'is_flexible': isFlexible,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to create a link for an invoice.
  ///
  /// Returns the created invoice link as *String* on success
  Future<String> createInvoiceLink(
      String title,
      String description,
      String payload,
      String providerToken,
      String currency,
      List<LabeledPrice> prices,
      {int? maxTipAmount,
      List<int>? suggestedTipAmounts,
      String? providerData,
      String? photoUrl,
      int? photoSize,
      int? photoWidth,
      int? photoHeight,
      bool? needName,
      bool? needPhoneNumber,
      bool? needEmail,
      bool? needShippingAddress,
      bool? sendPhoneNumberToProvider,
      bool? sendEmailToProvider,
      bool? isFlexible}) async {
    var requestUrl = _apiUri('createInvoiceLink');
    var body = <String, dynamic>{};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to reply to shipping queries.
  ///
  /// If you sent an invoice requesting a shipping address and the parameter *isFlexible* was specified,
  /// the Bot API will send an [Update] with a *shippingQuery* field to the bot.
  ///
  /// On success, *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#answershippingquery
  Future<bool> answerShippingQuery(String shippingQueryId, bool ok,
      {List<ShippingOption>? shippingOptions, String? errorMessage}) async {
    if (!ok && (shippingOptions == null || errorMessage == null)) {
      return Future.error(TelegramException(
          'Attribute \'shippingOptions\' and \'errorMessage\' can not be null when \'ok\' = false'));
    }
    var requestUrl = _apiUri('answerShippingQuery');
    var body = <String, dynamic>{
      'shipping_query_id': shippingQueryId,
      'ok': ok,
      'shipping_options':
          shippingOptions == null ? null : jsonEncode(shippingOptions),
      'error_message': errorMessage,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to respond to such pre-checkout queries
  ///
  /// Once the user has confirmed their payment and shipping details,
  /// the Bot API sends the final confirmation in the form of an [Update] with the field *preCheckoutQuery*.
  ///
  /// On success, *True* is returned.
  ///
  /// **Note:** The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<bool> answerPreCheckoutQuery(String preCheckoutQueryId, bool ok,
      {String? errorMessage}) async {
    if (!ok && errorMessage == null) {
      return Future.error(TelegramException(
          'Attribute \'errorMessage\' can not be null when \'ok\' = false'));
    }
    var requestUrl = _apiUri('answerPreCheckoutQuery');
    var body = <String, dynamic>{
      'pre_checkout_query_id': preCheckoutQueryId,
      'ok': ok,
      'error_message': errorMessage,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Informs a user that some of the Telegram Passport elements they provided contains errors.
  ///
  /// The user will not be able to re-submit their Passport to you until the errors are fixed
  /// (the contents of the field for which you returned the error must change).
  ///
  /// Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason.
  /// For example, if a birthday date seems invalid, a submitted document is blurry,
  /// a scan shows evidence of tampering, etc.
  /// Supply some details in the error message to make sure the user knows how to correct the issues.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setpassportdataerrors
  Future<bool> setPassportDataErrors(
      int userId, List<PassportElementError> errors) async {
    var requestUrl = _apiUri('setPassportDataErrors');
    var body = <String, dynamic>{
      'user_id': userId,
      'errors': jsonEncode(errors),
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send a game
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<Message> sendGame(dynamic chatId, String gameShortName,
      {int? messageThreadId,
      bool? disableNotification,
      bool? protectContent,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      InlineKeyboardMarkup? replyMarkup}) async {
    if (chatId is! String && chatId is! int) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendGame');
    var body = <String, dynamic>{
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'game_short_name': gameShortName,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup == null ? null : jsonEncode(replyMarkup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to set the score of the specified user in a game
  ///
  /// On success, if the message was sent by the bot, returns the edited [Message],
  /// otherwise returns *True*. Returns an error,
  /// if the score is not greater than the user's current score in the chat and force is *False*.
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<Message> setGameScore(int userId, int score,
      {bool? force,
      bool? disableEditMessage,
      dynamic chatId,
      int? messageId,
      String? inlineMessageId}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setGameScore');
    var body = <String, dynamic>{
      'user_id': userId,
      'score': score,
      'force': force,
      'disable_edit_message': disableEditMessage,
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to get data for high score tables
  ///
  /// Will return the score of the specified user and several of his neighbors in a game.
  /// On success, returns an *Array* of [GameHighScore] objects.
  ///
  /// This method will currently return scores for the target user,
  /// plus two of his closest neighbors on each side.
  /// Will also return the top three users if the user and his neighbors are not among them.
  /// Please note that this behavior is subject to change.
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<List<GameHighScore>> getGameHighScores(int userId,
      {dynamic chatId, int? messageId, String? inlineMessageId}) async {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      return Future.error(TelegramException(
          'Require either \'chatId\' and \'messageId\', or \'inlineMessageId\''));
    }
    if (chatId != null && (chatId is! String && chatId is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chatId\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getGameHighScores');
    var body = <String, dynamic>{
      'user_id': userId,
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
    };
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<GameHighScore>(
            (gameHighScore) => GameHighScore.fromJson(gameHighScore))
        .toList();
  }
}

class TelegramException implements Exception {
  String cause;
  TelegramException(this.cause);
  @override
  String toString() => 'TelegramException: $cause';
}
