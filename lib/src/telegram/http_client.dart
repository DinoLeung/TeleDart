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

import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final _dson = new Dartson.JSON();

  /// HTTP get method
  /// [url] request url with query string (required)
  /// [returnType] - nominate a type return object
  /// [isList] - true if return list of nominated object
  Future<dynamic> httpGet(String url, {Object returnType, bool isList}) async {
    return http.get(url).then((response) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body['ok'])
        return returnType != null
            ? _dson.map(body['result'], returnType, isList)
            : body['result'];
      else
        return new Future.error(new HttpClientException(
            '${body['error_code']} ${body['description']}'));
    }).catchError(
        (error) => new Future.error(new HttpClientException('${error}')));
  }

  /// HTTP post method (x-www-form-urlencoded)
  /// [url] - request url (required)
  /// [body] - parameters in map
  /// [returnType] - nominate a type return object
  /// [isList] - true if return list of nominated object
  /// [jsonItem] - specific json child other then `result`
  Future<dynamic> httpPost(String url,
      {Map body, Object returnType, bool isList, String jsonItem}) async {
    return http.post(url, body: body).then((response) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body['ok']) {
        dynamic json =
            (jsonItem == null ? body['result'] : body['result'][jsonItem]);
        return returnType != null ? _dson.map(json, returnType, isList) : json;
      } else
        return new Future.error(new HttpClientException(
            '${body['error_code']} ${body['description']}'));
    }).catchError(
        (error) => new Future.error(new HttpClientException('${error}')));
  }

  /// HTTP post method (multipart/form-data)
  /// [url] - request url (required)
  /// [file] - file to upload (required)
  /// [body] - parameters in map
  /// [returnType] - nominate a type return object
  /// [isList] - true if return list of nominated object
  /// [jsonItem] - specific json child other then `result`
  Future<dynamic> httpMultipartPost(String url, http.MultipartFile file,
      {Map body, Object returnType, bool isList, String jsonItem}) async {
    http.MultipartRequest request =
        new http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll({'Content-Type': 'multipart/form-data'})
          ..fields.addAll(body)
          ..files.add(file);
    return request
        .send()
        .then((response) => http.Response.fromStream(response))
        .then((response) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body['ok']) {
        dynamic json =
            (jsonItem == null ? body['result'] : body['result'][jsonItem]);
        return returnType != null ? _dson.map(json, returnType, isList) : json;
      } else
        return new Future.error(new HttpClientException(
            '${body['error_code']} ${body['description']}'));
    }).catchError(
            (error) => new Future.error(new HttpClientException('${error}')));
  }
}

class HttpClientException implements Exception {
  String cause;
  HttpClientException(this.cause);
  String toString() => 'HttpClientException: ${cause}';
}
