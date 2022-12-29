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
      List<String>? allowed_updates}) async {
    var requestUrl = _apiUri('getUpdates', {
      'offset': ['$offset'],
      'limit': ['$limit'],
      'timeout': ['$timeout'],
      'allowed_updates': [jsonEncode(allowed_updates)]
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
  /// If you'd like to make sure that the Webhook request comes from Telegram,
  /// we recommend using a secret path in the URL, e.g. `https://www.example.com/<token>`.
  /// Since nobody else knows your bot‘s token, you can be pretty sure it’s us.
  ///
  /// **Notes**
  /// 1. You will not be able to receive updates using [getUpdates] for as long as an outgoing webhook is set up.
  /// 2. To use a self-signed certificate, you need to upload your [public key certificate] using certificate parameter. Please upload as InputFile, sending a String will not work.
  /// 3. Ports currently supported for Webhooks: **443, 80, 88, 8443**.
  ///
  /// **NEW!** If you're having any trouble setting up webhooks, please check out this amazing guide to Webhooks.
  ///
  /// https://core.telegram.org/bots/api#setwebhook
  ///
  /// [public key certificate]: https://core.telegram.org/bots/self-signed
  Future<bool> setWebhook(String url,
      {String? ip_address,
      io.File? certificate,
      int? max_connections,
      List<String>? allowed_updates,
      bool? drop_pending_updates}) async {
    var requestUrl = _apiUri('setWebhook');

    var body = <String, dynamic>{
      'url': url,
      'ip_address': ip_address,
      'max_connections': max_connections,
      'allowed_updates':
          allowed_updates == null ? null : jsonEncode(allowed_updates),
      'drop_pending_updates': drop_pending_updates,
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
  Future<bool> deleteWebhook({bool? drop_pending_updates}) async {
    var requestUrl = _apiUri('deleteWebhook');
    var body = <String, dynamic>{'drop_pending_updates': drop_pending_updates};
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
  Future<Message> sendMessage(dynamic chat_id, String text,
      {String? parse_mode,
      List<MessageEntity>? entities,
      bool? disable_web_page_preview,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendMessage');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'text': text,
      'parse_mode': parse_mode,
      'entities': entities == null ? null : jsonEncode(entities),
      'disable_web_page_preview': disable_web_page_preview,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to forward messages of any kind. On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<Message> forwardMessage(
      dynamic chat_id, int from_chat_id, int message_id,
      {bool? disable_notification, bool? protect_content}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('forwardMessage');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'from_chat_id': from_chat_id,
      'message_id': message_id,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
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
  Future<MessageId> copyMessage(
    dynamic chat_id,
    int from_chat_id,
    int message_id, {
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? disable_notification,
    bool? protect_content,
    int? reply_to_message_id,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('copyMessage');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'from_chat_id': from_chat_id,
      'message_id': message_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup)
    };
    return MessageId.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send photos
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<Message> sendPhoto(dynamic chat_id, dynamic photo,
      {String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendPhoto');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (photo is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(photo, 'photo'));
    } else if (photo is String) {
      body.addAll({'photo': photo});
    } else {
      return Future.error(TelegramException(
          'Attribute \'photo\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendAudio(dynamic chat_id, dynamic audio,
      {String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      int? duration,
      String? performer,
      String? title,
      dynamic thumb,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendAudio');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'duration': duration,
      'performer': performer,
      'title': title,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (audio is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(audio, 'audio'));
    } else if (audio is String) {
      body.addAll({'audio': audio});
    } else {
      return Future.error(TelegramException(
          'Attribute \'audio\' can only be either io.File or String (Telegram file_id or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendDocument(dynamic chat_id, dynamic document,
      {dynamic thumb,
      String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      bool? disable_content_type_detection,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendDocument');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'disable_content_type_detection': disable_content_type_detection,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (document is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(document, 'document'));
    } else if (document is String) {
      body.addAll({'document': document});
    } else {
      return Future.error(TelegramException(
          'Attribute \'document\' can only be either io.File or String (Telegram file_id or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendVideo(dynamic chat_id, dynamic video,
      {int? duration,
      int? width,
      int? height,
      dynamic thumb,
      String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      bool? supports_streaming,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVideo');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'duration': duration,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'supports_streaming': supports_streaming,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (video is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(video, 'video'));
    } else if (video is String) {
      body.addAll({'video': video});
    } else {
      return Future.error(TelegramException(
          'Attribute \'video\' can only be either io.File or String (Telegram file_id or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendAnimation(dynamic chat_id, dynamic animation,
      {int? duration,
      int? width,
      int? height,
      dynamic thumb,
      String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendAnimation');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'duration': duration,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (animation is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(animation, 'animation'));
    } else if (animation is String) {
      body.addAll({'animation': animation});
    } else {
      return Future.error(TelegramException(
          'Attribute \'animation\' can only be either io.File or String (Telegram file_id or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendVoice(dynamic chat_id, dynamic voice,
      {String? caption,
      String? parse_mode,
      List<MessageEntity>? caption_entities,
      int? duration,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVoice');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'caption_entities':
          caption_entities == null ? null : jsonEncode(caption_entities),
      'duration': duration,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (voice is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(voice, 'voice'));
    } else if (voice is String) {
      body.addAll({'voice': voice});
    } else {
      return Future.error(TelegramException(
          'Attribute \'voice\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<Message> sendVideoNote(dynamic chat_id, dynamic video_note,
      {int? duration,
      int? length,
      dynamic thumb,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVideoNote');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'duration': duration,
      'length': length,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };

    var multiPartFiles = <MultipartFile>[];

    if (video_note is io.File) {
      multiPartFiles.add(HttpClient.toMultiPartFile(video_note, 'video_note'));
    } else if (video_note is String) {
      body.addAll({'video_note': video_note});
    } else {
      return Future.error(TelegramException(
          'Attribute \'video_note\' can only be either io.File or String (Telegram file_id or image url)'));
    }

    if (thumb != null) {
      if (thumb is io.File) {
        multiPartFiles.add(HttpClient.toMultiPartFile(thumb, 'thumb'));
      } else if (thumb is String) {
        body.addAll({'thumb': thumb});
      } else {
        return Future.error(TelegramException(
            'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
    }

    return multiPartFiles.isEmpty
        ? Message.fromJson(await HttpClient.httpPost(requestUrl, body: body))
        : Message.fromJson(await HttpClient.httpMultipartPost(
            requestUrl, multiPartFiles,
            body: body));
  }

  // TODO: #9
  // ! media can only take file_id or url
  // * need to implement POST multipart/form-data uploading files
  // * or even mixed input
  /// Use this method to send a group of photos or videos as an album
  ///
  /// On success, an array of the sent [Message]s is returned.
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<List<Message>> sendMediaGroup(dynamic chat_id, List<InputMedia> media,
      {bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendMediaGroup');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'media': jsonEncode(media),
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
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
      dynamic chat_id, double latitude, double longitude,
      {double? horizontal_accuracy,
      int? live_period,
      int? heading,
      int? proximity_alert_radius,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendLocation');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'horizontal_accuracy': horizontal_accuracy,
      'live_period': live_period,
      'heading': heading,
      'proximity_alert_radius': proximity_alert_radius,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to edit live location messages sent by the bot or via the bot
  /// (for [inline bots]).
  ///
  /// A location can be edited until its *live_period* expires or editing is explicitly disabled by a
  /// call to [stopMessageLiveLocation].
  /// On success, if the edited message was sent by the bot,
  /// the edited [Message] is returned, otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagelivelocation
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      double? horizontal_accuracy,
      int? heading,
      int? proximity_alert_radius,
      ReplyMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageLiveLocation');
    var body = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'horizontal_accuracy': horizontal_accuracy,
      'heading': heading,
      'proximity_alert_radius': proximity_alert_radius,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to stop updating a live location message sent by the bot or via the bot
  /// (for [inline bots]) before *live_period* expires.
  ///
  /// On success, if the message was sent by the bot, the sent [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  ///
  /// [inline bots]: https://core.telegram.org/bots/api#inline-mode
  Future<Message> stopMessageLiveLocation(
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      ReplyMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('stopMessageLiveLocation');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send information about a venue
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<Message> sendVenue(dynamic chat_id, double latitude, double longitude,
      String title, String address,
      {String? foursquare_id,
      String? foursquare_type,
      String? google_place_id,
      String? google_place_type,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendVenue');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquare_id,
      'foursquare_type': foursquare_type,
      'google_place_id': google_place_id,
      'google_place_type': google_place_type,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send phone contacts
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<Message> sendContact(
      dynamic chat_id, String phone_number, String first_name,
      {String? last_name,
      String? vcard,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendContact');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'phone_number': phone_number,
      'first_name': first_name,
      'last_name': last_name,
      'vcard': vcard,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
      dynamic chat_id, String question, List<String> options,
      {bool? is_anonymous,
      String? type,
      bool? allows_multiple_answers,
      int? correct_option_id,
      String? explanation,
      String? explanation_parse_mode,
      List<MessageEntity>? explanation_entities,
      int? open_period,
      int? close_date,
      bool? is_closed,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendPoll');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'question': question,
      'options': jsonEncode(options),
      'is_anonymous': is_anonymous,
      'type': type,
      'allows_multiple_answers': allows_multiple_answers,
      'correct_option_id': correct_option_id,
      'explanation': explanation,
      'explanation_parse_mode': explanation_parse_mode,
      'explanation_entities': explanation_entities == null
          ? null
          : jsonEncode(explanation_entities),
      'open_period': open_period,
      'close_date': close_date,
      'is_closed': is_closed,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to send an animated emoji that will display a random value
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendDice(dynamic chat_id,
      {String emoji = Dice.DICE,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendDice');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'emoji': emoji,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
  /// the bot may use [sendChatAction] with action = upload_photo.
  /// The user will see a “sending photo” status for the bot.
  ///
  /// We only recommend using this method when a response from the bot will take a **noticeable**
  /// amount of time to arrive.
  ///
  /// https://core.telegram.org/bots/api#sendchataction
  ///
  /// [ImageBot]: https://t.me/imagebot
  Future<bool> sendChatAction(dynamic chat_id, String action) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendChatAction');
    var body = <String, dynamic>{'chat_id': chat_id, 'action': action};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get a list of profile pictures for a user
  ///
  /// Returns a [UserProfilePhotos] object.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<UserProfilePhotos> getUserProfilePhotos(int user_id,
      {int? offset, int? limit}) async {
    var requestUrl = _apiUri('getUserProfilePhotos');
    var body = <String, dynamic>{
      'user_id': user_id,
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
  Future<File> getFile(String file_id) async {
    var requestUrl = _apiUri('getFile');
    var body = <String, dynamic>{'file_id': file_id};
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
  Future<bool> banChatMember(dynamic chat_id, int user_id,
      {int? until_date, bool? revoke_messages}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('banChatMember');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
      'until_date': until_date,
      'revoke_messages': revoke_messages,
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
  Future<bool> unbanChatMember(dynamic chat_id, int user_id,
      {bool? only_if_banned}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unbanChatMember');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
      'only_if_banned': only_if_banned,
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
  Future<bool> restrictChatMember(dynamic chat_id, int user_id,
      {ChatPermissions? permissions, int? until_date}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('restrictChatMember');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
      'permissions': permissions == null ? null : jsonEncode(permissions),
      'until_date': until_date,
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
  Future<bool> promoteChatMember(dynamic chat_id, int user_id,
      {bool? is_anonymous,
      bool? can_manage_chat,
      bool? can_post_messages,
      bool? can_edit_messages,
      bool? can_delete_messages,
      bool? can_manage_voice_chats,
      bool? can_restrict_members,
      bool? can_promote_members,
      bool? can_change_info,
      bool? can_invite_users,
      bool? can_pin_messages}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('promoteChatMember');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
      'is_anonymous': is_anonymous,
      'can_manage_chat': can_manage_chat,
      'can_post_messages': can_post_messages,
      'can_edit_messages': can_edit_messages,
      'can_delete_messages': can_delete_messages,
      'can_manage_voice_chats': can_manage_voice_chats,
      'can_restrict_members': can_restrict_members,
      'can_promote_members': can_promote_members,
      'can_change_info': can_change_info,
      'can_invite_users': can_invite_users,
      'can_pin_messages': can_pin_messages,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatadministratorcustomtitle
  Future<bool> setChatAdministratorCustomTitle(
      dynamic chat_id, int user_id, String custom_title) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatAdministratorCustomTitle');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
      'custom_title': custom_title,
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
  Future<bool> banChatSenderChat(dynamic chat_id, int sender_chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('banChatSenderChat');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'sender_chat_id': sender_chat_id,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to unban a previously banned channel chat in a supergroup or channel
  ///
  /// The bot must be an administrator for this to work and must have the appropriate administrator rights.
  ///
  /// Returns *True* on success.
  Future<bool> unbanChatSenderChat(dynamic chat_id, int sender_chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unbanChatSenderChat');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'sender_chat_id': sender_chat_id,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set default chat permissions for all members
  ///
  /// The bot must be an administrator in the group or a supergroup for this to work
  /// and must have the can_restrict_members admin rights.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> setChatPermissions(
      dynamic chat_id, ChatPermissions permissions) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatPermissions');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'permissions': jsonEncode(permissions),
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
  Future<String> exportChatInviteLink(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('exportChatInviteLink');
    var body = <String, dynamic>{'chat_id': chat_id};
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
  Future<ChatInviteLink> createChatInviteLink(dynamic chat_id,
      {String? name,
      int? expire_date,
      int? member_limit,
      bool? creates_join_request}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('createChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'name': name,
      'expire_date': expire_date,
      'member_limit': member_limit,
      'creates_join_request': creates_join_request,
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
  Future<ChatInviteLink> editChatInviteLink(dynamic chat_id, String invite_link,
      {String? name,
      int? expire_date,
      int? member_limit,
      bool? creates_join_request}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'invite_link': invite_link,
      'name': name,
      'expire_date': expire_date,
      'member_limit': member_limit,
      'creates_join_request': creates_join_request,
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
      dynamic chat_id, String invite_link) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('revokeChatInviteLink');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'invite_link': invite_link,
    };
    return ChatInviteLink.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to approve a chat join request
  ///
  /// The bot must be an administrator in the chat for this to work and must have the *can_invite_users* administrator right.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#approvechatjoinrequest
  Future<bool> approveChatJoinRequest(dynamic chat_id, int user_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('approveChatJoinRequest');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to decline a chat join request
  ///
  /// The bot must be an administrator in the chat for this to work and must have the *can_invite_users* administrator right.
  ///
  /// Returns *True* on success.
  Future<bool> declineChatJoinRequest(dynamic chat_id, int user_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('declineChatJoinRequest');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
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
  Future<bool> setChatPhoto(dynamic chat_id, io.File photo) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatPhoto');
    var body = <String, dynamic>{'chat_id': chat_id};
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
  Future<bool> deleteChatPhoto(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteChatPhoto');
    var body = <String, dynamic>{'chat_id': chat_id};
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
  Future<bool> setChatTitle(dynamic chat_id, String title) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatTitle');
    var body = <String, dynamic>{
      'chat_id': chat_id,
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
  Future<bool> setChatDescription(dynamic chat_id,
      {String? description}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatDescription');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'description': description,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to pin a message in a supergroup or a channel
  ///
  /// The bot must be an administrator in the chat for this to work and must have the
  /// ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right
  /// in the channel.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<bool> pinChatMessage(dynamic chat_id, int message_id,
      {bool? disable_notification}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('pinChatMessage');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'disable_notification': disable_notification,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to remove a message from the list of pinned messages in a chat
  ///
  /// If the chat is not a private chat, the bot must be an administrator in the chat for
  /// this to work and must have the 'can_pin_messages' admin right in a supergroup or
  /// 'can_edit_messages' admin right in a channel.
  ///
  /// Returns *True* on success.
  ///
  /// If `message_id` not specified, the most recent pinned message (by sending date) will be unpinned.
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<bool> unpinChatMessage(dynamic chat_id, {int? message_id}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unpinChatMessage');
    var body = <String, dynamic>{'chat_id': chat_id, 'message_id': message_id};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to clear the list of pinned messages in a chat
  ///
  /// If the chat is not a private chat, the bot must be an administrator in the chat for
  /// this to work and must have the 'can_pin_messages' admin right in a supergroup or
  /// 'can_edit_messages' admin right in a channel.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#unpinallchatmessages
  Future<bool> unpinAllChatMessages(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('unpinAllChatMessages');
    var body = <String, dynamic>{'chat_id': chat_id};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method for your bot to leave a group, supergroup or channel
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<bool> leaveChat(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('leaveChat');
    var body = <String, dynamic>{'chat_id': chat_id};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get up to date information about the chat
  /// (current name of the user for one-on-one conversations,
  /// current username of a user, group or channel, etc.).
  ///
  /// Returns a [Chat] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<Chat> getChat(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChat');
    var body = <String, dynamic>{'chat_id': chat_id};
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
  Future<List<ChatMember>> getChatAdministrators(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatAdministrators');
    var body = <String, dynamic>{'chat_id': chat_id};
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// Use this method to get the number of members in a chat
  ///
  /// Returns [int] on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmembercount
  Future<int> getChatMemberCount(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatMemberCount');
    var body = <String, dynamic>{'chat_id': chat_id};
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to get information about a member of a chat
  ///
  /// Returns a [ChatMember] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<ChatMember> getChatMember(dynamic chat_id, int user_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getChatMember');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'user_id': user_id,
    };
    return ChatMember.fromJson(
        await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to set a group sticker set for a supergroup
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  /// Use the field *can_set_sticker_set* optionally returned in [getChat] requests to check if the
  /// bot can use this method.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<bool> setChatStickerSet(
      dynamic chat_id, String sticker_set_name) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setChatStickerSet');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'sticker_set_name': sticker_set_name,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to delete a group sticker set from a supergroup
  ///
  /// The bot must be an administrator in the chat for this to work and must have the appropriate
  /// admin rights.
  /// Use the field *can_set_sticker_set* optionally returned in [getChat] requests to check if the
  /// bot can use this method.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<bool> deleteChatStickerSet(dynamic chat_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteChatStickerSet');
    var body = <String, dynamic>{'chat_id': chat_id};
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
  Future<bool> answerCallbackQuery(String callback_query_id,
      {String? text, bool? show_alert, String? url, int? cache_time}) async {
    var requestUrl = _apiUri('answerCallbackQuery');
    var body = <String, dynamic>{
      'callback_query_id': callback_query_id,
      'text': text,
      'show_alert': show_alert,
      'url': url,
      'cache_time': cache_time,
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
      {BotCommandScope? scope, String? language_code}) async {
    var requestUrl = _apiUri('setMyCommands');
    var body = <String, dynamic>{
      'commands': jsonEncode(commands),
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': language_code,
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
      {BotCommandScope? scope, String? language_code}) async {
    var requestUrl = _apiUri('deleteMyCommands');
    var body = <String, dynamic>{
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': language_code,
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
      {BotCommandScope? scope, String? language_code}) async {
    var requestUrl = _apiUri('getMyCommands');
    var body = <String, dynamic>{
      'scope': scope == null ? null : jsonEncode(scope),
      'language_code': language_code,
    };
    return (await HttpClient.httpPost(requestUrl, body: body))
        .map<BotCommand>((botCommand) => BotCommand.fromJson(botCommand))
        .toList();
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
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      String? parse_mode,
      bool? disable_web_page_preview,
      InlineKeyboardMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageText');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'text': text,
      'parse_mode': parse_mode,
      'disable_web_page_preview': disable_web_page_preview,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      String? caption,
      String? parse_mode,
      InlineKeyboardMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageCaption');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
  /// Use previously uploaded file via its file_id or specify a URL.
  ///
  /// On success, if the edited message was sent by the bot, the edited [Message] is returned,
  /// otherwise *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#editMessageMedia
  Future<Message> editMessageMedia(
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      InputMedia? media,
      String? parse_mode,
      InlineKeyboardMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageMedia');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'media': media == null ? null : jsonEncode(media),
      'parse_mode': parse_mode,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
      {dynamic chat_id,
      int? message_id,
      String? inline_message_id,
      InlineKeyboardMarkup? reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('editMessageReplyMarkup');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
  Future<Poll> stopPoll(dynamic chat_id, int message_id,
      InlineKeyboardMarkup reply_markup) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('stopPoll');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
      'reply_markup': reply_markup,
    };
    return Poll.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to delete a message, including service messages
  ///
  /// It has the following limitations:
  /// * A message can only be deleted if it was sent less than 48 hours ago.
  /// * Bots can delete outgoing messages in groups and supergroups.
  /// * Bots can delete incoming messages in private chats.
  /// * Bots granted can_post_messages permissions can delete outgoing messages in channels.
  /// * If the bot is an administrator of a group, it can delete any message there.
  /// * If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<bool> deleteMessage(dynamic chat_id, int message_id) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('deleteMessage');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'message_id': message_id,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send .webp stickers
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<Message> sendSticker(dynamic chat_id, dynamic sticker,
      {bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      ReplyMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendSticker');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
          'Attribute \'sticker\' can only be either io.File or String (Telegram file_id or image url)'));
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

  /// Use this method to upload a .png file with a sticker for later use in
  /// *createNewStickerSet* and *addStickerToSet* methods (can be used multiple times)
  ///
  /// Returns the uploaded [File] on success.
  ///
  /// https://core.telegram.org/bots/api#uploadstickerfile
  Future<File> uploadStickerFile(int user_id, io.File png_sticker) async {
    var requestUrl = _apiUri('uploadStickerFile');
    var body = <String, dynamic>{'user_id': user_id};
    // filename cannot be empty to post to Telegram server
    var files = List<MultipartFile>.filled(
        1,
        MultipartFile(
            'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
            filename: '${png_sticker.lengthSync()}'));
    return File.fromJson(
        await HttpClient.httpMultipartPost(requestUrl, files, body: body));
  }

  /// Use this method to create sticker set owned by a user
  ///
  /// The bot will be able to edit the created sticker set.
  /// You **must** use exactly one of the *fields png_sticker*, *tgs_sticker*, or *webm_sticker*.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<bool> createNewStickerSet(
      int user_id, String name, String title, String emojis,
      {dynamic png_sticker,
      io.File? tgs_sticker,
      io.File? webm_sticker,
      bool? contains_masks,
      MaskPosition? mask_position}) async {
    var requestUrl = _apiUri('createNewStickerSet');
    var botInfo = await getMe();
    var body = <String, dynamic>{
      'user_id': user_id,
      'name': '${name}_by_${botInfo.username}',
      'title': title,
      'emojis': emojis,
      'contains_masks': contains_masks,
      'mask_position': mask_position == null ? null : jsonEncode(mask_position),
    };

    if (png_sticker == null && tgs_sticker == null && webm_sticker == null) {
      return Future.error(TelegramException(
          'You must use exactly one of the fields `png_sticker`, `tgs_sticker` or `webm_sticker`.'));
    } else if (png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return await HttpClient.httpPost(requestUrl, body: body);
    } else if (png_sticker is io.File || tgs_sticker != null || webm_sticker != null ) {
      var file = png_sticker ?? tgs_sticker ?? webm_sticker;
      var fieldName = png_sticker != null ? 'png_sticker' : tgs_sticker != null ? 'tgs_sticker' : 'webm_sticker';
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile(
              fieldName, file.openRead(), file.lengthSync(),
              filename: '${file.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return Future.error(TelegramException(
          'Attribute \'png_sticker\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// Use this method to add a new sticker to a set created by the bot
  ///
  /// You **must** use exactly one of the *fields png_sticker*, *tgs_sticker*, or *webm_sticker*.
  /// Animated stickers can be added to animated sticker sets and only to them.
  /// Animated sticker sets can have up to 50 stickers.
  /// Static sticker sets can have up to 120 stickers.
  ///
  /// Returns *True* on success.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<bool> addStickerToSet(int user_id, String name, String emojis,
      {dynamic png_sticker,
      io.File? tgs_sticker,
      io.File? webm_sticker,
      MaskPosition? mask_position}) async {
    var requestUrl = _apiUri('addStickerToSet');
    var body = <String, dynamic>{
      'user_id': user_id,
      'name': name,
      'emojis': emojis,
      'mask_position': mask_position == null ? null : jsonEncode(mask_position),
    };

    if (png_sticker == null && tgs_sticker == null && webm_sticker == null) {
      return Future.error(TelegramException(
          'You must use exactly one of the fields `png_sticker`, `tgs_sticker` or `webm_sticker`.'));
    } else if (png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return await HttpClient.httpPost(requestUrl, body: body);
    } else if (png_sticker is io.File || tgs_sticker != null || webm_sticker != null ) {
      var file = png_sticker ?? tgs_sticker ?? webm_sticker;
      var fieldName = png_sticker != null ? 'png_sticker' : tgs_sticker != null ? 'tgs_sticker' : 'webm_sticker';
      // filename cannot be empty to post to Telegram server
      var files = List<MultipartFile>.filled(
          1,
          MultipartFile(
              fieldName, file.openRead(), file.lengthSync(),
              filename: '${file.lengthSync()}'));
      return await HttpClient.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return Future.error(TelegramException(
          'Attribute \'png_sticker\' can only be either io.File or String (Telegram file_id or image url)'));
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
  Future<bool> setStickerSetThumb(String name, int user_id,
      {dynamic thumb}) async {
    var requestUrl = _apiUri('setStickerSetThumb');
    var body = <String, dynamic>{
      'name': name,
      'user_id': user_id,
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
          'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
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
      String inline_query_id, List<InlineQueryResult> results,
      {int? cache_time,
      bool? is_personal,
      String? next_offset,
      String? switch_pm_text,
      String? switch_pm_parameter}) async {
    var requestUrl = _apiUri('answerInlineQuery');
    var body = <String, dynamic>{
      'inline_query_id': inline_query_id,
      'results': jsonEncode(results),
      'cache_time': cache_time,
      'is_personal': is_personal,
      'next_offset': next_offset,
      'switch_pm_text': switch_pm_text,
      'switch_pm_parameter': switch_pm_parameter,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to set the result of an interaction with a [Web App] and send a corresponding
  /// message on behalf of the user to the chat from which the query originated.
  /// 
  /// On success, a [SentWebAppMessage] object is returned.
  /// 
  /// https://core.telegram.org/bots/api#answerwebappquery
  Future<SentWebAppMessage> answerWebAppQuery(String web_app_query_id, InlineQueryResult result) async {
    var requestUrl = _apiUri('answerWebAppQuery');
    var body = <String, dynamic>{
      'web_app_query_id': web_app_query_id,
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
      dynamic chat_id,
      String title,
      String description,
      String payload,
      String provider_token,
      String currency,
      List<LabeledPrice> prices,
      {int? max_tip_amount,
      List<int>? suggested_tip_amounts,
      String? start_parameter,
      String? provider_data,
      String? photo_url,
      int? photo_size,
      int? photo_width,
      int? photo_height,
      bool? need_name,
      bool? need_phone_number,
      bool? need_email,
      bool? need_shipping_address,
      bool? send_phone_number_to_provider,
      bool? send_email_to_provider,
      bool? is_flexible,
      bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      InlineKeyboardMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendInvoice');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': provider_token,
      'currency': currency,
      'prices': jsonEncode(prices),
      'max_tip_amount': max_tip_amount,
      'suggested_tip_amounts': suggested_tip_amounts == null
          ? null
          : jsonEncode(suggested_tip_amounts),
      'start_parameter': start_parameter,
      'provider_data': provider_data,
      'photo_url': photo_url,
      'photo_size': photo_size,
      'photo_width': photo_width,
      'photo_height': photo_height,
      'need_name': need_name,
      'need_phone_number': need_phone_number,
      'need_email': need_email,
      'need_shipping_address': need_shipping_address,
      'send_phone_number_to_provider': send_phone_number_to_provider,
      'send_email_to_provider': send_email_to_provider,
      'is_flexible': is_flexible,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
    };
    return Message.fromJson(await HttpClient.httpPost(requestUrl, body: body));
  }

  /// Use this method to reply to shipping queries.
  ///
  /// If you sent an invoice requesting a shipping address and the parameter *is_flexible* was specified,
  /// the Bot API will send an [Update] with a *shipping_query* field to the bot.
  ///
  /// On success, *True* is returned.
  ///
  /// https://core.telegram.org/bots/api#answershippingquery
  Future<bool> answerShippingQuery(String shipping_query_id, bool ok,
      {List<ShippingOption>? shipping_options, String? error_message}) async {
    if (!ok && (shipping_options == null || error_message == null)) {
      return Future.error(TelegramException(
          'Attribute \'shipping_options\' and \'error_message\' can not be null when \'ok\' = false'));
    }
    var requestUrl = _apiUri('answerShippingQuery');
    var body = <String, dynamic>{
      'shipping_query_id': shipping_query_id,
      'ok': ok,
      'shipping_options':
          shipping_options == null ? null : jsonEncode(shipping_options),
      'error_message': error_message,
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to respond to such pre-checkout queries
  ///
  /// Once the user has confirmed their payment and shipping details,
  /// the Bot API sends the final confirmation in the form of an [Update] with the field *pre_checkout_query*.
  ///
  /// On success, *True* is returned.
  ///
  /// **Note:** The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<bool> answerPreCheckoutQuery(String pre_checkout_query_id, bool ok,
      {String? error_message}) async {
    if (!ok && error_message == null) {
      return Future.error(TelegramException(
          'Attribute \'error_message\' can not be null when \'ok\' = false'));
    }
    var requestUrl = _apiUri('answerPreCheckoutQuery');
    var body = <String, dynamic>{
      'pre_checkout_query_id': pre_checkout_query_id,
      'ok': ok,
      'error_message': error_message,
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
      int user_id, List<PassportElementError> errors) async {
    var requestUrl = _apiUri('setPassportDataErrors');
    var body = <String, dynamic>{
      'user_id': user_id,
      'errors': jsonEncode(errors),
    };
    return await HttpClient.httpPost(requestUrl, body: body);
  }

  /// Use this method to send a game
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<Message> sendGame(dynamic chat_id, String game_short_name,
      {bool? disable_notification,
      bool? protect_content,
      int? reply_to_message_id,
      bool? allow_sending_without_reply,
      InlineKeyboardMarkup? reply_markup}) async {
    if (chat_id is! String && chat_id is! int) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('sendGame');
    var body = <String, dynamic>{
      'chat_id': chat_id,
      'game_short_name': game_short_name,
      'disable_notification': disable_notification,
      'protect_content': protect_content,
      'reply_to_message_id': reply_to_message_id,
      'allow_sending_without_reply': allow_sending_without_reply,
      'reply_markup': reply_markup == null ? null : jsonEncode(reply_markup),
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
  Future<Message> setGameScore(int user_id, int score,
      {bool? force,
      bool? disable_edit_message,
      dynamic chat_id,
      int? message_id,
      String? inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('setGameScore');
    var body = <String, dynamic>{
      'user_id': user_id,
      'score': score,
      'force': force,
      'disable_edit_message': disable_edit_message,
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
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
  Future<List<GameHighScore>> getGameHighScores(int user_id,
      {dynamic chat_id, int? message_id, String? inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    }
    if (chat_id != null && (chat_id is! String && chat_id is! int)) {
      return Future.error(TelegramException(
          'Attribute \'chat_id\' can only be either type of String or int'));
    }
    var requestUrl = _apiUri('getGameHighScores');
    var body = <String, dynamic>{
      'user_id': user_id,
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
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
