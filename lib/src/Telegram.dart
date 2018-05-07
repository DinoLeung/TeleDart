import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

import 'package:TeleDart/src/Model.dart';

class Telegram {

  final String _baseUrl = 'https://api.telegram.org/bot';
  String _token;
  Telegram(this._token);

  var dson = new Dartson.JSON();

  Future<List<Update>> getUpdates({int offset, int limit, int timeout}) async {

    String url = '${_baseUrl}${_token}/getUpdates?'
      + (offset == null ? '' : 'offset=${offset}&')
      + (limit == null ? '' : 'limit=${limit}&')
      + (timeout == null ? '' : 'timeout=${timeout}');

    return http.get(url)
      .then((response) {
        if (response.statusCode == 200 || response.statusCode == 0)
          return dson.map
            (JSON.decode(response.body)['result'], new Update(), true);
        else
          return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
      })
      .catchError((error) {
        return new Future.error(error);
      });
  }

  // TODO: need to be tested
  Future<bool> setWebhook({String url, List<int> certificate, int max_connections, List<String> allowed_updates}) async {
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
    return http.get('${_baseUrl}${_token}/deleteWebhook')
      .then((response) {
        if (response.statusCode == 200 || response.statusCode == 0)
          return JSON.decode(response.body)['result'];
        else
          return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
      })
      .catchError((error) {
        return new Future.error(error);
      });

  }

  Future<WebhookInfo> getWebhookInfo() async {
    return http.get('${_baseUrl}${_token}/getWebhookInfo')
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return dson.map
          (JSON.decode(response.body)['result'], new WebhookInfo());
      else
        return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
    })
        .catchError((error) {
      return new Future.error(error);
    });
  }

  Future<User> getMe() async {
    return http.get('${_baseUrl}${_token}/getMe')
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return dson.map
          (JSON.decode(response.body)['result'], new User());
      else
        return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
    })
        .catchError((error) {
      return new Future.error(error);
    });
  }

}