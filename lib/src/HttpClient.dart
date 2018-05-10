import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  var dson = new Dartson.JSON();

  Future httpGet(String url, [Object type, bool isList]) async {
    return http.get(url)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return type != null ?
        dson.map(JSON.decode(response.body)['result'], type, isList) :
        JSON.decode(response.body)['result'];
      else
        return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
    })
        .catchError((error) {
      return new Future.error(error);
    });
  }

  Future httpPost(String url, [Map body, Object type, bool isList]) async {
    return http.post(url,
        body: body)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return type != null ?
        dson.map(JSON.decode(response.body)['result'], type, isList) :
        JSON.decode(response.body)['result'];
      else
        return new Future.error('Telegram error: HTTP status code ' + response.statusCode.toString());
    })
        .catchError((error) {
      return new Future.error(error);
    });
  }
}