/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:http/http.dart' as http;

class HttpClient {
  static bool _nullFilter(_, value) => value == null;

  static http.MultipartFile toMultiPartFile(io.File file, String fieldName) =>
      http.MultipartFile(fieldName, file.openRead(), file.lengthSync(),
          filename: '${file.path.split(io.Platform.pathSeparator).last}');

  /// HTTP get method
  /// [url] request url with query string (required)
  static Future<dynamic> httpGet(String url) async =>
      http.get(url).then((response) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['ok']) {
          return responseBody['result'];
        } else {
          return Future.error(HttpClientException(
              responseBody['error_code'], responseBody['description']));
        }
      }).catchError((error) => Future.error(error));

  /// HTTP post method (x-www-form-urlencoded)
  /// [url] - request url (required)
  /// [body] - parameters in map
  static Future<dynamic> httpPost(String url,
      {Map<String, dynamic> body}) async {
    body.removeWhere(_nullFilter);
    return http
        .post(url, body: body.map((k, v) => MapEntry(k, '$v')))
        .then((response) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['ok']) {
        return responseBody['result'];
      } else {
        return Future.error(HttpClientException(
            responseBody['error_code'], responseBody['description']));
      }
    }).catchError((error) => Future.error(error));
  }

  /// HTTP post method (multipart/form-data)
  /// [url] - request url (required)
  /// [file] - file to upload (required)
  /// [body] - parameters in map
  static Future<dynamic> httpMultipartPost(
      String url, List<http.MultipartFile> files,
      {Map<String, dynamic> body}) async {
    body.removeWhere(_nullFilter);
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll({'Content-Type': 'multipart/form-data'})
      ..fields.addAll(body.map((k, v) => MapEntry(k, '$v')))
      ..files.addAll(files);
    return request
        .send()
        .then((response) => http.Response.fromStream(response))
        .then((response) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['ok']) {
        return responseBody['result'];
      } else {
        return Future.error(HttpClientException(
            responseBody['error_code'], responseBody['description']));
      }
    }).catchError((error) => Future.error(error));
  }
}

class HttpClientException implements Exception {
  int code;
  String description;
  HttpClientException(this.code, this.description);
  bool isHttpClientError() => code >= 400 && code < 500;
  @override
  String toString() => 'HttpClientException: $code $description';
}
