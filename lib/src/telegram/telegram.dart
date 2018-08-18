/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2018  Dino PH Leung
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

import 'package:http/http.dart' as http;

import 'model.dart';
import 'http_client.dart';

class Telegram {
  final HttpClient _client = new HttpClient();
  final String _baseUrl = 'https://api.telegram.org/bot';
  final String _token;

  Telegram(this._token);

  /// [https://core.telegram.org/bots/api#getupdates](https://core.telegram.org/bots/api#getupdates)
  Future<List<Update>> getUpdates(
      {int offset,
      int limit,
      int timeout,
      List<String> allowed_updates}) async {
    String requestUrl = '${_baseUrl}${_token}/getUpdates?' +
        (offset == null ? '' : 'offset=${offset}&') +
        (limit == null ? '' : 'limit=${limit}&') +
        (timeout == null ? '' : 'timeout=${timeout}') +
        (allowed_updates == null
            ? ''
            : 'allowed_updates=${jsonEncode(allowed_updates)}');
    return (await _client.httpGet(requestUrl))
        .map<Update>((update) => Update.fromJson(update))
        .toList();
  }

  /// [https://core.telegram.org/bots/api#setWebhook](https://core.telegram.org/bots/api#setWebhook)
  Future<bool> setWebhook(String url,
      {io.File certificate,
      int max_connections,
      List<String> allowed_updates}) async {
    String requestUrl = '${_baseUrl}${_token}/setWebhook';
    Map<String, dynamic> body = {
      'url': url,
      'max_connections': max_connections ?? '',
      'allowed_updates': allowed_updates ?? ''
    };
    if (certificate != null) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List();
      files.add(http.MultipartFile(
          'certificate', certificate.openRead(), certificate.lengthSync(),
          filename: '${certificate.lengthSync()}'));
      return _client.httpMultipartPost(requestUrl, files, body: body);
    } else {
      return _client.httpPost(requestUrl, body: body);
    }
  }

  /// [https://core.telegram.org/bots/api#deleteWebhook](https://core.telegram.org/bots/api#deleteWebhook)
  Future<bool> deleteWebhook() async {
    return _client.httpGet('${_baseUrl}${_token}/deleteWebhook');
  }

  /// [https://core.telegram.org/bots/api#getWebhookInfo](https://core.telegram.org/bots/api#getWebhookInfo)
  Future<WebhookInfo> getWebhookInfo() async {
    return WebhookInfo.fromJson(
        await _client.httpGet('${_baseUrl}${_token}/getWebhookInfo'));
  }

  /// [https://core.telegram.org/bots/api#getme](https://core.telegram.org/bots/api#getme)
  Future<User> getMe() async {
    return User.fromJson(await _client.httpGet('${_baseUrl}${_token}/getMe'));
  }

  /// [https://core.telegram.org/bots/api#sendMessage](https://core.telegram.org/bots/api#sendMessage)
  Future<Message> sendMessage(int chat_id, String text,
      {String parse_mode,
      bool disable_web_page_preview,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendMessage';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'text': text,
      'parse_mode': parse_mode ?? '',
      'disable_web_page_preview': disable_web_page_preview ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#forwardMessage](https://core.telegram.org/bots/api#forwardMessage)
  Future<Message> forwardMessage(int chat_id, int from_char_id, int message_id,
      {bool disable_notification}) async {
    String requestUrl = '${_baseUrl}${_token}/forwardMessage';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'from_char_id': from_char_id,
      'message_id': message_id,
      'disable_notification': disable_notification ?? ''
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#sendPhoto](https://core.telegram.org/bots/api#sendPhoto)
  Future<Message> sendPhoto(int chat_id, dynamic photo,
      {String caption,
      String parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendPhoto';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (photo is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List();
      files.add(new http.MultipartFile(
          'photo', photo.openRead(), photo.lengthSync(),
          filename: '${photo.lengthSync()}'));
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (photo is String) {
      body.addAll({'photo': photo});
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'photo\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendAudio](https://core.telegram.org/bots/api#sendAudio)
  Future<Message> sendAudio(int chat_id, dynamic audio,
      {String caption,
      String parse_mode,
      int duration,
      String performer,
      String title,
      dynamic thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendAudio';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'duration': duration ?? '',
      'performer': performer ?? '',
      'title': title ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (audio is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile('audio', audio.openRead(), audio.lengthSync(),
              filename: '${audio.lengthSync()}'));
      if (thumb != null) {
        if (thumb is io.File)
          files.add(new http.MultipartFile(
              'thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
        else if (thumb is String)
          body.addAll({'thumb': thumb});
        else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (audio is String) {
      body.addAll({'audio': audio});
      if (thumb != null) {
        if (thumb is io.File)
          return Message.fromJson(await _client.httpMultipartPost(
              requestUrl,
              new List.filled(
                  1,
                  new http.MultipartFile(
                      'thumb', thumb.openRead(), thumb.lengthSync(),
                      filename: '${thumb.lengthSync()}')),
              body: body));
        else if (thumb is String) {
          body.addAll({'thumb': thumb});
        } else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'audio\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendDocument](https://core.telegram.org/bots/api#sendDocument)
  Future<Message> sendDocument(int chat_id, dynamic document,
      {dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendDocument';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (document is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'document', document.openRead(), document.lengthSync(),
              filename: '${document.lengthSync()}'));
      if (thumb != null) {
        if (thumb is io.File)
          files.add(new http.MultipartFile(
              'thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
        else if (thumb is String)
          body.addAll({'thumb': thumb});
        else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (document is String) {
      body.addAll({'document': document});
      if (thumb != null) {
        if (thumb is io.File)
          return Message.fromJson(await _client.httpMultipartPost(
              requestUrl,
              new List.filled(
                  1,
                  new http.MultipartFile(
                      'thumb', thumb.openRead(), thumb.lengthSync(),
                      filename: '${thumb.lengthSync()}')),
              body: body));
        else if (thumb is String) {
          body.addAll({'thumb': thumb});
        } else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'document\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendVideo](https://core.telegram.org/bots/api#sendVideo)
  Future<Message> sendVideo(int chat_id, dynamic video,
      {int duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool supports_streaming,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVideo';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'duration': duration ?? '',
      'width': width ?? '',
      'height': height ?? '',
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'supports_streaming': supports_streaming ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (video is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile('video', video.openRead(), video.lengthSync(),
              filename: '${video.lengthSync()}'));
      if (thumb != null) {
        if (thumb is io.File)
          files.add(new http.MultipartFile(
              'thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
        else if (thumb is String)
          body.addAll({'thumb': thumb});
        else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (video is String) {
      body.addAll({'video': video});
      if (thumb != null) {
        if (thumb is io.File)
          return Message.fromJson(await _client.httpMultipartPost(
              requestUrl,
              new List.filled(
                  1,
                  new http.MultipartFile(
                      'thumb', thumb.openRead(), thumb.lengthSync(),
                      filename: '${thumb.lengthSync()}')),
              body: body));
        else if (thumb is String) {
          body.addAll({'thumb': thumb});
        } else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'video\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendAnimation](https://core.telegram.org/bots/api#sendAnimation)
  Future<Message> sendAnimation(int chat_id, dynamic animation,
      {int duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendAnimation';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'duration': duration ?? '',
      'width': width ?? '',
      'height': height ?? '',
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (animation is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'animation', animation.openRead(), animation.lengthSync(),
              filename: '${animation.lengthSync()}'));
      if (thumb != null) {
        if (thumb is io.File)
          files.add(new http.MultipartFile(
              'thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
        else if (thumb is String)
          body.addAll({'thumb': thumb});
        else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (animation is String) {
      body.addAll({'video': animation});
      if (thumb != null) {
        if (thumb is io.File)
          return Message.fromJson(await _client.httpMultipartPost(
              requestUrl,
              new List.filled(
                  1,
                  new http.MultipartFile(
                      'thumb', thumb.openRead(), thumb.lengthSync(),
                      filename: '${thumb.lengthSync()}')),
              body: body));
        else if (thumb is String) {
          body.addAll({'thumb': thumb});
        } else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'animation\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendVoice](https://core.telegram.org/bots/api#sendVoice)
  Future<Message> sendVoice(int chat_id, dynamic voice,
      {String caption,
      String parse_mode,
      int duration,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVoice';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'duration': duration ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (voice is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile('voice', voice.openRead(), voice.lengthSync(),
              filename: '${voice.lengthSync()}'));
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (voice is String) {
      body.addAll({'voice': voice});
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'voice\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#sendVideoNote](https://core.telegram.org/bots/api#sendVideoNote)
  Future<Message> sendVideoNote(int chat_id, dynamic video_note,
      {int duration,
      int length,
      dynamic thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVideoNote';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'duration': duration ?? '',
      'length': length ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (video_note is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'video_note', video_note.openRead(), video_note.lengthSync(),
              filename: '${video_note.lengthSync()}'));
      if (thumb != null) {
        if (thumb is io.File)
          files.add(new http.MultipartFile(
              'thumb', thumb.openRead(), thumb.lengthSync(),
              filename: '${thumb.lengthSync()}'));
        else if (thumb is String)
          body.addAll({'thumb': thumb});
        else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (video_note is String) {
      body.addAll({'video_note': video_note});
      if (thumb != null) {
        if (thumb is io.File)
          return Message.fromJson(await _client.httpMultipartPost(
              requestUrl,
              new List.filled(
                  1,
                  new http.MultipartFile(
                      'thumb', thumb.openRead(), thumb.lengthSync(),
                      filename: '${thumb.lengthSync()}')),
              body: body));
        else if (thumb is String) {
          body.addAll({'thumb': thumb});
        } else
          return new Future.error(new TelegramException(
              'Attribute \'thumb\' can only be either io.File or String (Telegram file_id or image url)'));
      }
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'video_note\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  // TODO: #9
  /// [https://core.telegram.org/bots/api#sendMediaGroup](https://core.telegram.org/bots/api#sendMediaGroup)
  Future<List<Message>> sendMediaGroup(int chat_id, List<InputMedia> media,
      {bool disable_notification, int reply_to_message_id}) async {
    String requestUrl = '${_baseUrl}${_token}/sendMediaGroup';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'media': jsonEncode(media),
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? ''
    };
    return (await _client.httpPost(requestUrl, body: body))
        .map<Message>((message) => Message.fromJson(message))
        .toList();
  }

  /// [https://core.telegram.org/bots/api#sendLocation](https://core.telegram.org/bots/api#sendLocation)
  Future<Message> sendLocation(int chat_id, double latitude, double longitude,
      {int live_period,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendLocation';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#editMessageLiveLocation](https://core.telegram.org/bots/api#editMessageLiveLocation)
  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {int chat_id,
      int message_id,
      String inline_message_id,
      ReplyMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/editMessageLiveLocation';
    Map<String, dynamic> body = {
      'latitude': latitude,
      'longitude': longitude,
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#stopMessageLiveLocation](https://core.telegram.org/bots/api#stopMessageLiveLocation)
  Future<Message> stopMessageLiveLocation(
      {int chat_id,
      int message_id,
      String inline_message_id,
      ReplyMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/stopMessageLiveLocation';
    Map<String, dynamic> body = {
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#sendVenue](https://core.telegram.org/bots/api#sendVenue)
  Future<Message> sendVenue(int chat_id, double latitude, double longitude,
      String title, String address,
      {String foursquare_id,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVenue';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquare_id ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#sendContact](https://core.telegram.org/bots/api#sendContact)
  Future<Message> sendContact(
      int chat_id, String phone_number, String first_name,
      {String last_name,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendContact';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'phone_number': phone_number,
      'first_name': first_name,
      'last_name': last_name ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#sendChatAction](https://core.telegram.org/bots/api#sendChatAction)
  Future<bool> sendChatAction(int chat_id, String action) async {
    String requestUrl = '${_baseUrl}${_token}/sendChatAction';
    Map<String, dynamic> body = {'chat_id': chat_id, 'action': action};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#getUserProfilePhotos](https://core.telegram.org/bots/api#getUserProfilePhotos)
  Future<List<UserProfilePhotos>> getUserProfilePhotos(int user_id,
      {int offset, int limit}) async {
    String requestUrl = '${_baseUrl}${_token}/getUserProfilePhotos';
    Map<String, dynamic> body = {
      'user_id': user_id,
      'offset': offset ?? '',
      'limit': limit ?? ''
    };
    return ((await _client.httpPost(requestUrl, body: body))['photos'])
        .map<UserProfilePhotos>((photo) => UserProfilePhotos.fromJson(photo))
        .toList();
  }

  /// [https://core.telegram.org/bots/api#getFile](https://core.telegram.org/bots/api#getFile)
  Future<File> getFile(String file_id) async {
    String requestUrl = '${_baseUrl}${_token}/getFile';
    Map<String, dynamic> body = {'file_id': file_id};
    return File.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#kickChatMember](https://core.telegram.org/bots/api#kickChatMember)
  Future<bool> kickChatMember(int chat_id, int user_id,
      {int until_date}) async {
    String requestUrl = '${_baseUrl}${_token}/kickChatMember';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'user_id': user_id,
      'until_date': until_date ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#unbanChatMember](https://core.telegram.org/bots/api#unbanChatMember)
  Future<bool> unbanChatMember(int chat_id, int user_id) async {
    String requestUrl = '${_baseUrl}${_token}/unbanChatMember';
    Map<String, dynamic> body = {'chat_id': chat_id, 'user_id': user_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#restrictChatMember](https://core.telegram.org/bots/api#restrictChatMember)
  Future<bool> restrictChatMember(int chat_id, int user_id,
      {int until_date,
      bool can_send_messages,
      bool can_send_media_messages,
      bool can_send_other_messages,
      bool can_add_web_page_previews}) async {
    String requestUrl = '${_baseUrl}${_token}/unbanChatMember';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'user_id': user_id,
      'until_date': until_date ?? '',
      'can_send_messages': can_send_messages ?? '',
      'can_send_media_messages': can_send_media_messages ?? '',
      'can_send_other_messages': can_send_other_messages ?? '',
      'can_add_web_page_previews': can_add_web_page_previews ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#promoteChatMember](https://core.telegram.org/bots/api#promoteChatMember)
  Future<bool> promoteChatMember(int chat_id, int user_id,
      {bool can_change_info,
      bool can_post_messages,
      bool can_edit_messages,
      bool can_delete_messages,
      bool can_invite_users,
      bool can_restrict_members,
      bool can_pin_messages,
      bool can_promote_members}) async {
    String requestUrl = '${_baseUrl}${_token}/promoteChatMember';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'user_id': user_id,
      'can_change_info': can_change_info ?? '',
      'can_post_messages': can_post_messages ?? '',
      'can_edit_messages': can_edit_messages ?? '',
      'can_delete_messages': can_delete_messages ?? '',
      'can_invite_users': can_invite_users ?? '',
      'can_restrict_members': can_restrict_members ?? '',
      'can_pin_messages': can_pin_messages ?? '',
      'can_promote_members': can_promote_members ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#exportChatInviteLink](https://core.telegram.org/bots/api#exportChatInviteLink)
  Future<String> exportChatInviteLink(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/exportChatInviteLink';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#setChatPhoto](https://core.telegram.org/bots/api#setChatPhoto)
  Future<bool> setChatPhoto(int chat_id, io.File photo) async {
    String requestUrl = '${_baseUrl}${_token}/setChatPhoto';
    Map<String, dynamic> body = {'chat_id': chat_id};
    // filename cannot be empty to post to Telegram server
    List<http.MultipartFile> files = new List.filled(
        1,
        new http.MultipartFile('photo', photo.openRead(), photo.lengthSync(),
            filename: '${photo.lengthSync()}'));
    return _client.httpMultipartPost(requestUrl, files, body: body);
  }

  /// [https://core.telegram.org/bots/api#deleteChatPhoto](https://core.telegram.org/bots/api#deleteChatPhoto)
  Future<bool> deleteChatPhoto(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteChatPhoto';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#setChatTitle](https://core.telegram.org/bots/api#setChatTitle)
  Future<bool> setChatTitle(int chat_id, String title) async {
    String requestUrl = '${_baseUrl}${_token}/setChatTitle';
    Map<String, dynamic> body = {'chat_id': chat_id, 'title': title};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#setChatDescription](https://core.telegram.org/bots/api#setChatDescription)
  Future<bool> setChatDescription(int chat_id, {String description}) async {
    String requestUrl = '${_baseUrl}${_token}/setChatDescription';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'description': description ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#pinChatMessage](https://core.telegram.org/bots/api#pinChatMessage)
  Future<bool> pinChatMessage(int chat_id, int message_id,
      {bool disable_notification}) async {
    String requestUrl = '${_baseUrl}${_token}/pinChatMessage';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'message_id': message_id,
      'disable_notification': disable_notification ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#unpinChatMessage](https://core.telegram.org/bots/api#unpinChatMessage)
  Future<bool> unpinChatMessage(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/unpinChatMessage';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#leaveChat](https://core.telegram.org/bots/api#leaveChat)
  Future<bool> leaveChat(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/leaveChat';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#getChat](https://core.telegram.org/bots/api#getChat)
  Future<Chat> getChat(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChat';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return Chat.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#getChatAdministrators](https://core.telegram.org/bots/api#getChatAdministrators)
  Future<List<ChatMember>> getChatAdministrators(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatAdministrators';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return (await _client.httpPost(requestUrl, body: body))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// [https://core.telegram.org/bots/api#getChatMembersCount](https://core.telegram.org/bots/api#getChatMembersCount)
  Future<int> getChatMembersCount(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatMembersCount';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#getChatMember](https://core.telegram.org/bots/api#getChatMember)
  Future<ChatMember> getChatMember(int chat_id, int user_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatMember';
    Map<String, dynamic> body = {'chat_id': chat_id, 'user_id': user_id};
    return ChatMember.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#setChatStickerSet](https://core.telegram.org/bots/api#setChatStickerSet)
  Future<bool> setChatStickerSet(int chat_id, String sticker_set_name) async {
    String requestUrl = '${_baseUrl}${_token}/setChatStickerSet';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'sticker_set_name': sticker_set_name
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#deleteChatStickerSet](https://core.telegram.org/bots/api#deleteChatStickerSet)
  Future<bool> deleteChatStickerSet(int chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteChatStickerSet';
    Map<String, dynamic> body = {'chat_id': chat_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#answerCallbackQuery](https://core.telegram.org/bots/api#answerCallbackQuery)
  Future<bool> answerCallbackQuery(String callback_query_id,
      {String text, bool show_alert, String url, int cache_time}) async {
    String requestUrl = '${_baseUrl}${_token}/answerCallbackQuery';
    Map<String, dynamic> body = {
      'callback_query_id': callback_query_id,
      'text': text ?? '',
      'show_alert': show_alert ?? '',
      'url': url ?? '',
      'cache_time': cache_time ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#editMessageText](https://core.telegram.org/bots/api#editMessageText)
  Future<Message> editMessageText(String text,
      {int chat_id,
      int message_id,
      String inline_message_id,
      String parse_mode,
      bool disable_web_page_preview,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/editMessageText';
    Map<String, dynamic> body = {
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'text': text,
      'parse_mode': parse_mode ?? '',
      'disable_web_page_preview': disable_web_page_preview ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if (res == true)
      return new Future.error(
          new TelegramException('Edited message is NOT sent by the bot'));
    else
      return Message.fromJson(res);
  }

  /// [https://core.telegram.org/bots/api#editMessageCaption](https://core.telegram.org/bots/api#editMessageCaption)
  Future<Message> editMessageCaption(
      {int chat_id,
      int message_id,
      String inline_message_id,
      String caption,
      String parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/editMessageCaption';
    Map<String, dynamic> body = {
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'caption': caption ?? '',
      'parse_mode': parse_mode ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if (res == true)
      return new Future.error(
          new TelegramException('Edited message is NOT sent by the bot'));
    else
      return Message.fromJson(res);
  }

  /// [https://core.telegram.org/bots/api#editMessageMedia](https://core.telegram.org/bots/api#editMessageMedia)
  Future<Message> editMessageMedia(
      {int chat_id,
      int message_id,
      String inline_message_id,
      InputMedia media,
      String parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/editMessageMedia';
    Map<String, dynamic> body = {
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'media': media == null ? '' : jsonEncode(media),
      'parse_mode': parse_mode ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if (res == true)
      return new Future.error(
          new TelegramException('Edited message is NOT sent by the bot'));
    else
      return Message.fromJson(res);
  }

  /// [https://core.telegram.org/bots/api#editMessageReplyMarkup](https://core.telegram.org/bots/api#editMessageReplyMarkup)
  Future<Message> editMessageReplyMarkup(
      {int chat_id,
      int message_id,
      String inline_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/editMessageReplyMarkup';
    Map<String, dynamic> body = {
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if (res == true)
      return new Future.error(
          new TelegramException('Edited message is NOT sent by the bot'));
    else
      return Message.fromJson(res);
  }

  /// [https://core.telegram.org/bots/api#deleteMessage](https://core.telegram.org/bots/api#deleteMessage)
  Future<bool> deleteMessage(int chat_id, int message_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteMessage';
    Map<String, dynamic> body = {'chat_id': chat_id, 'message_id': message_id};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#sendSticker](https://core.telegram.org/bots/api#sendSticker)
  Future<Message> sendSticker(int chat_id, dynamic sticker,
      {bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendSticker';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };

    if (sticker is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'sticker', sticker.openRead(), sticker.lengthSync(),
              filename: '${sticker.lengthSync()}'));
      return Message.fromJson(
          await _client.httpMultipartPost(requestUrl, files, body: body));
    } else if (sticker is String) {
      body.addAll({'sticker': sticker});
      return Message.fromJson(await _client.httpPost(requestUrl, body: body));
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'sticker\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#getStickerSet](https://core.telegram.org/bots/api#getStickerSet)
  Future<StickerSet> getStickerSet(String name) async {
    String requestUrl = '${_baseUrl}${_token}/getStickerSet';
    Map<String, dynamic> body = {'name': name};
    return StickerSet.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#uploadStickerFile](https://core.telegram.org/bots/api#uploadStickerFile)
  Future<File> uploadStickerFile(int user_id, io.File png_sticker) async {
    String requestUrl = '${_baseUrl}${_token}/uploadStickerFile';
    Map<String, dynamic> body = {'user_id': user_id};
    // filename cannot be empty to post to Telegram server
    List<http.MultipartFile> files = new List.filled(
        1,
        new http.MultipartFile(
            'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
            filename: '${png_sticker.lengthSync()}'));
    return File.fromJson(
        await _client.httpMultipartPost(requestUrl, files, body: body));
  }

  /// [https://core.telegram.org/bots/api#createNewStickerSet](https://core.telegram.org/bots/api#createNewStickerSet)
  Future<bool> createNewStickerSet(int user_id, String name, String title,
      dynamic png_sticker, String emojis,
      {bool contains_masks, MaskPosition mask_position}) async {
    String requestUrl = '${_baseUrl}${_token}/createNewStickerSet';
    User botInfo = await getMe();
    Map<String, dynamic> body = {
      'user_id': user_id,
      'name': '${name}_by_${botInfo.username}',
      'title': title,
      'emojis': emojis,
      'contains_masks': contains_masks ?? '',
      'mask_position': mask_position == null ? '' : jsonEncode(mask_position)
    };

    if (png_sticker is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
              filename: '${png_sticker.lengthSync()}'));
      return _client.httpMultipartPost(requestUrl, files, body: body);
    } else if (png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return _client.httpPost(requestUrl, body: body);
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'png_sticker\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#addStickerToSet](https://core.telegram.org/bots/api#addStickerToSet)
  Future<bool> addStickerToSet(
      int user_id, String name, io.File png_sticker, String emojis,
      {MaskPosition mask_position}) async {
    String requestUrl = '${_baseUrl}${_token}/addStickerToSet';
    Map<String, dynamic> body = {
      'user_id': user_id,
      'name': name,
      'emojis': emojis,
      'mask_position': mask_position == null ? '' : jsonEncode(mask_position)
    };

    if (png_sticker is io.File) {
      // filename cannot be empty to post to Telegram server
      List<http.MultipartFile> files = new List.filled(
          1,
          new http.MultipartFile(
              'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
              filename: '${png_sticker.lengthSync()}'));
      return _client.httpMultipartPost(requestUrl, files, body: body);
    } else if (png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return _client.httpPost(requestUrl, body: body);
    } else {
      return new Future.error(new TelegramException(
          'Attribute \'png_sticker\' can only be either io.File or String (Telegram file_id or image url)'));
    }
  }

  /// [https://core.telegram.org/bots/api#setStickerPositionInSet](https://core.telegram.org/bots/api#setStickerPositionInSet)
  Future<bool> setStickerPositionInSet(String sticker, int position) async {
    String requestUrl = '${_baseUrl}${_token}/setStickerPositionInSet';
    Map<String, dynamic> body = {'sticker': sticker, 'position': position};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#deleteStickerFromSet](https://core.telegram.org/bots/api#deleteStickerFromSet)
  Future<bool> deleteStickerFromSet(String sticker) async {
    String requestUrl = '${_baseUrl}${_token}/deleteStickerFromSet';
    Map<String, dynamic> body = {'sticker': sticker};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#answerInlineQuery](https://core.telegram.org/bots/api#answerInlineQuery)
  Future<bool> answerInlineQuery(
      String inline_query_id, List<InlineQueryResult> results,
      {int cache_time,
      bool is_personal,
      String next_offset,
      String switch_pm_text,
      String switch_pm_parameter}) async {
    String requestUrl = '${_baseUrl}${_token}/answerInlineQuery';
    Map<String, dynamic> body = {
      'inline_query_id': inline_query_id,
      'results': jsonEncode(results),
      'cache_time': cache_time ?? '',
      'is_personal': is_personal ?? '',
      'next_offset': next_offset ?? '',
      'switch_pm_text': switch_pm_text ?? '',
      'switch_pm_parameter': switch_pm_parameter ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#sendInvoice](https://core.telegram.org/bots/api#sendInvoice)
  Future<Message> sendInvoice(
      int chat_id,
      String title,
      String description,
      String payload,
      String provider_token,
      String start_parameter,
      String currency,
      List<LabeledPrice> prices,
      {String provider_data,
      String photo_url,
      int photo_size,
      int photo_width,
      int photo_height,
      bool need_name,
      bool need_phone_number,
      bool need_email,
      bool need_shipping_address,
      bool send_phone_number_to_provider,
      bool send_email_to_provider,
      bool is_flexible,
      bool disable_notification,
      int reply_to_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendInvoice';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': provider_token,
      'start_parameter': start_parameter,
      'currency': currency,
      'prices': jsonEncode(prices),
      'provider_data': provider_data ?? '',
      'photo_url': photo_url ?? '',
      'photo_size': photo_size ?? '',
      'photo_width': photo_width ?? '',
      'photo_height': photo_height ?? '',
      'need_name': need_name ?? '',
      'need_phone_number': need_phone_number ?? '',
      'need_email': need_email ?? '',
      'need_shipping_address': need_shipping_address ?? '',
      'send_phone_number_to_provider': send_phone_number_to_provider ?? '',
      'send_email_to_provider': send_email_to_provider ?? '',
      'is_flexible': is_flexible ?? '',
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#answerShippingQuery](https://core.telegram.org/bots/api#answerShippingQuery)
  Future<bool> answerShippingQuery(String shipping_query_id, bool ok,
      {List<ShippingOption> shipping_options, String error_message}) async {
    if (!ok && (shipping_options == null || error_message == null))
      return new Future.error(new TelegramException(
          'Attribute \'shipping_options\' and \'error_message\' can not be null when \'ok\' = false'));
    String requestUrl = '${_baseUrl}${_token}/answerShippingQuery';
    Map<String, dynamic> body = {
      'shipping_query_id': shipping_query_id,
      'ok': ok,
      'shipping_options':
          shipping_options == null ? '' : jsonEncode(shipping_options),
      'error_message': error_message ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#answerPreCheckoutQuery](https://core.telegram.org/bots/api#answerPreCheckoutQuery)
  Future<bool> answerPreCheckoutQuery(String pre_checkout_query_id, bool ok,
      {String error_message}) async {
    if (!ok && error_message == null)
      return new Future.error(new TelegramException(
          'Attribute \'error_message\' can not be null when \'ok\' = false'));
    String requestUrl = '${_baseUrl}${_token}/answerShippingQuery';
    Map<String, dynamic> body = {
      'pre_checkout_query_id': pre_checkout_query_id,
      'ok': ok,
      'error_message': error_message ?? ''
    };
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#setpassportdataerrors](https://core.telegram.org/bots/api#setpassportdataerrors)
  Future<bool> setPassportDataErrors(
      int user_id, List<PassportElementError> errors) async {
    String requestUrl = '${_baseUrl}${_token}/setPassportDataErrors';
    Map<String, dynamic> body = {'user_id': user_id, 'errors': errors};
    return _client.httpPost(requestUrl, body: body);
  }

  /// [https://core.telegram.org/bots/api#sendGame](https://core.telegram.org/bots/api#sendGame)
  Future<Message> sendGame(int chat_id, String game_short_name,
      {bool disable_notification,
      int reply_to_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendGame';
    Map<String, dynamic> body = {
      'chat_id': chat_id,
      'game_short_name': game_short_name,
      'disable_notification': disable_notification ?? '',
      'reply_to_message_id': reply_to_message_id ?? '',
      'reply_markup': reply_markup == null ? '' : jsonEncode(reply_markup)
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#setGameScore](https://core.telegram.org/bots/api#setGameScore)
  Future<Message> setGameScore(int user_id, int score,
      {bool force,
      bool disable_edit_message,
      int chat_id,
      int message_id,
      String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/setGameScore';
    Map<String, dynamic> body = {
      'user_id': user_id,
      'score': score,
      'force': force ?? '',
      'disable_edit_message': disable_edit_message ?? '',
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? ''
    };
    return Message.fromJson(await _client.httpPost(requestUrl, body: body));
  }

  /// [https://core.telegram.org/bots/api#getGameHighScores](https://core.telegram.org/bots/api#getGameHighScores)
  Future<List<GameHighScore>> getGameHighScores(int user_id,
      {int chat_id, int message_id, String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null))
      return new Future.error(new TelegramException(
          'Require either \'chat_id\' and \'message_id\', or \'inline_message_id\''));
    String requestUrl = '${_baseUrl}${_token}/getGameHighScores';
    Map<String, dynamic> body = {
      'user_id': user_id,
      'chat_id': chat_id ?? '',
      'message_id': message_id ?? '',
      'inline_message_id': inline_message_id ?? ''
    };
    return (await _client.httpPost(requestUrl, body: body))
        .map<GameHighScore>(
            (gameHighScore) => GameHighScore.fromJson(gameHighScore))
        .toList();
  }
}

class TelegramException implements Exception {
  String cause;
  TelegramException(this.cause);
  String toString() => 'TelegramException: ${cause}';
}
