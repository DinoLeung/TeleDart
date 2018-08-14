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

import 'package:http/http.dart' as http;

class HttpClient {
  /// HTTP get method
  /// [url] request url with query string (required)
  Future<dynamic> httpGet(String url) async {
    return http.get(url).then((response) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body['ok'])
        return body['result'];
      else
        return new Future.error(new HttpClientException(
            '${body['error_code']} ${body['description']}'));
    }).catchError(
        (error) => new Future.error(new HttpClientException('${error}')));
  }

  /// HTTP post method (x-www-form-urlencoded)
  /// [url] - request url (required)
  /// [body] - parameters in map
  Future<dynamic> httpPost(String url, {Map<String, dynamic> body}) async {
    return http
        .post(url, body: body.map((k, v) => MapEntry(k, '${v}')))
        .then((response) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['ok'])
        return responseBody['result'];
      else
        return new Future.error(new HttpClientException(
            '${responseBody['error_code']} ${responseBody['description']}'));
    }).catchError(
            (error) => new Future.error(new HttpClientException('${error}')));
  }

  /// HTTP post method (multipart/form-data)
  /// [url] - request url (required)
  /// [file] - file to upload (required)
  /// [body] - parameters in map
  Future<dynamic> httpMultipartPost(String url, http.MultipartFile file,
      {Map<String, dynamic> body}) async {
    http.MultipartRequest request =
        new http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll({'Content-Type': 'multipart/form-data'})
          ..fields.addAll(body.map((k, v) => MapEntry(k, '${v}')))
          ..files.add(file);
    return request
        .send()
        .then((response) => http.Response.fromStream(response))
        .then((response) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['ok'])
        return responseBody['result'];
      else
        return new Future.error(new HttpClientException(
            '${responseBody['error_code']} ${responseBody['description']}'));
    }).catchError(
            (error) => new Future.error(new HttpClientException('${error}')));
  }
}

class HttpClientException implements Exception {
  String cause;
  HttpClientException(this.cause);
  String toString() => 'HttpClientException: ${cause}';
}
