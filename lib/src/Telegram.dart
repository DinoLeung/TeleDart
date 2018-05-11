import 'dart:async';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

import './Model.dart';
import './HttpClient.dart';

class Telegram {

  final String _baseUrl = 'https://api.telegram.org/bot';
  String _token;
  Telegram(this._token);

  final _dson = new Dartson.JSON();
  final _client = new HttpClient();

  Future<List<Update>> getUpdates({int offset, int limit, int timeout}) async {

    String url = '${_baseUrl}${_token}/getUpdates?'
      + (offset == null ? '' : 'offset=${offset}&')
      + (limit == null ? '' : 'limit=${limit}&')
      + (timeout == null ? '' : 'timeout=${timeout}');

    return _client.httpGet(url, new Update(), true);
  }

  Future<bool> setWebhook(String url,
      {List<int> certificate, int max_connections,
        List<String> allowed_updates}) async {
    String url = '${_baseUrl}${_token}/setWebhook';
    Map body = {
      'url': url,
      'max_connections': max_connections == null ? '' : '${max_connections}',
      'allowed_updates': allowed_updates == null ? '' : '${allowed_updates}'
    };
    if(certificate.length > 0){
      http.MultipartFile file = new http.MultipartFile.fromBytes('certificate',
          certificate, filename: '${certificate.length}');
      return _client.httpMultipartPost(url, file, body);
    }
    else {
      return _client.httpPost(url, body);
    }
  }

  Future<bool> deleteWebhook() async {
    return _client.httpGet('${_baseUrl}${_token}/deleteWebhook');

  }

  Future<WebhookInfo> getWebhookInfo() async {
    return _client.httpGet('${_baseUrl}${_token}/getWebhookInfo', new WebhookInfo());
  }

  Future<User> getMe() async {
    return _client.httpGet('${_baseUrl}${_token}/getMe', new User());
  }

  Future<Message> sendMessage(int chat_id, String text,
      {String parse_mode, bool disable_web_page_preview, bool disable_notification
        , int reply_to_message_id, ReplyMarkup reply_markup}) async {
    Map body = {
      'chat_id': '${chat_id}',
      'text': text,
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_web_page_preview': (disable_web_page_preview == null ? '' : '${disable_web_page_preview}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost('${_baseUrl}${_token}/sendMessage', body, new Message());
  }

  Future<Message> forwardMessage(int chat_id, int from_char_id, int message_id,
      {bool disable_notification}) async {
    Map body = {
      'chat_id': '${chat_id}',
      'from_char_id': '${from_char_id}',
      'message_id': '${message_id}',
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}')
    };
    return _client.httpPost('${_baseUrl}${_token}/forwardMessage', body, new Message());
  }

  Future<Message> sendPhoto(int chat_id, photo,
      {String caption, String parse_mode, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String url = '${_baseUrl}${_token}/sendPhoto';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (parse_mode == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(photo is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('photo', photo,
          filename: '${photo.length}');
      return _client.httpMultipartPost(url, file, body, new Message());
    }
    else if(photo is String) {
      body.addAll({'photo': photo});
      return _client.httpPost(url, body, new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'photo\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendAudio(int chat_id, audio,
      {String caption, String parse_mode, int duration,
        String performer, String title, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String url = '${_baseUrl}${_token}/sendAudio';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (parse_mode == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'duration': (duration == null ? '' : '${duration}'),
      'performer': (performer == null ? '' : performer),
      'title': (title == null ? '' : title),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(audio is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('audio', audio,
          filename: '${audio.length}');
      return _client.httpMultipartPost(url, file, body, new Message());
    }
    else if(audio is String) {
      body.addAll({'audio': audio});
      return _client.httpPost(url, body, new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'audio\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendDocument(int chat_id, document,
      {String caption, String parse_mode, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String url = '${_baseUrl}${_token}/sendDocument';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (parse_mode == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(document is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('document', document,
          filename: '${document.length}');
      return _client.httpMultipartPost(url, file, body, new Message());
    }
    else if(document is String) {
      body.addAll({'document': document});
      return _client.httpPost(url, body, new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'document\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

}