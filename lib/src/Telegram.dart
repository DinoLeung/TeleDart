import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

import './Model.dart';
import './HttpClient.dart';

class Telegram {

  final String _baseUrl = 'https://api.telegram.org/bot';
  String _token;
  Telegram(this._token);

  var dson = new Dartson.JSON();
  var client = new HttpClient();

  Future<List<Update>> getUpdates({int offset, int limit, int timeout}) async {

    String url = '${_baseUrl}${_token}/getUpdates?'
      + (offset == null ? '' : 'offset=${offset}&')
      + (limit == null ? '' : 'limit=${limit}&')
      + (timeout == null ? '' : 'timeout=${timeout}');

    return client.httpGet(url, new Update(), true);
  }

  // TODO: need to be tested
  Future<bool> setWebhook(String url,
      {List<int> certificate, int max_connections,
        List<String> allowed_updates}) async {
    http.MultipartRequest request = new http.MultipartRequest('post', Uri.parse('${_baseUrl}${_token}/setWebhook'));
    request.fields.addAll({'url': url,
      'max_connections': max_connections.toString(),
      'allowed_updates': allowed_updates.toString()});
    request.files
        .add(new http.MultipartFile.fromBytes('certification', certificate));
    Future<String> res = await request.send().then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return response.stream.bytesToString();
      else
        return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
    })
        .catchError((error) {
      return new Future.error(error);
    });
    return JSON.decode(await res)['result'];
  }

  Future<bool> deleteWebhook() async {
    return client.httpGet('${_baseUrl}${_token}/deleteWebhook');

  }

  Future<WebhookInfo> getWebhookInfo() async {
    return client.httpGet('${_baseUrl}${_token}/getWebhookInfo', new WebhookInfo());
  }

  Future<User> getMe() async {
    return client.httpGet('${_baseUrl}${_token}/getMe', new User());
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
      'reply_markup': (reply_markup == null ? '' : dson.encode(reply_markup))
    };
    return client.httpPost('${_baseUrl}${_token}/sendMessage', body, new Message());
  }

  Future<Message> forwardMessage(int chat_id, int from_char_id, int message_id,
      {bool disable_notification}) async {
    Map body = {
      'chat_id': '${chat_id}',
      'from_char_id': '${from_char_id}',
      'message_id': '${message_id}',
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}')
    };
    return client.httpPost('${_baseUrl}${_token}/forwardMessage', body, new Message());
  }

}