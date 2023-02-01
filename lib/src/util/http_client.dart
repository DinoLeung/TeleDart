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

import 'package:http/http.dart' as http;

import '../../model.dart';

/// An internal helper class for easier http request management
class HttpClient {
  static bool _nullFilter(_, value) => value == null;

  static http.MultipartFile toMultiPartFile(io.File file, String fieldName) =>
      http.MultipartFile(fieldName, file.openRead(), file.lengthSync(),
          filename: file.path.split(io.Platform.pathSeparator).last);

  /// Parse http response
  /// [response] - http response
  static Future<dynamic> _parseResponse(http.Response response) {
    Map<String, dynamic> jsonBody = jsonDecode(response.body);
    Response responseBody = Response.fromJson(jsonBody);
    if (responseBody.ok) {
      return SuccessResponse.fromJson(jsonBody).result;
    } else {
      ErrorResponse errorResponse = ErrorResponse.fromJson(jsonBody);
      return Future.error(HttpClientException(errorResponse.errorCode,
          errorResponse.description, errorResponse.parameters));
    }
  }

  /// HTTP get method
  /// [url] request url with query string (required)
  static Future<dynamic> httpGet(Uri url) async => http
      .get(url)
      .then(_parseResponse)
      .catchError((error) => Future.error(error));

  /// HTTP post method (x-www-form-urlencoded)
  /// [url] - request url (required)
  /// [body] - parameters in map
  static Future<dynamic> httpPost(Uri url, {Map<String, dynamic>? body}) async {
    body?.removeWhere(_nullFilter);
    return http
        .post(url, body: body?.map((k, v) => MapEntry(k, '$v')))
        .then(_parseResponse)
        .catchError((error) => Future.error(error));
  }

  /// HTTP post method (multipart/form-data)
  /// [url] - request url (required)
  /// [file] - file to upload (required)
  /// [body] - parameters in map
  static Future<dynamic> httpMultipartPost(
      Uri url, List<http.MultipartFile> files,
      {Map<String, dynamic>? body}) async {
    body?.removeWhere(_nullFilter);
    var request = http.MultipartRequest('POST', url)
      ..headers.addAll({'Content-Type': 'multipart/form-data'})
      ..fields.addAll(body?.map((k, v) => MapEntry(k, '$v')) ?? {})
      ..files.addAll(files);
    return request
        .send()
        .then((response) => http.Response.fromStream(response))
        .then(_parseResponse)
        .catchError((error) => Future.error(error));
  }
}

class HttpClientException implements Exception {
  int code;
  String description;
  ResponseParameters? parameters;
  HttpClientException(this.code, this.description, this.parameters);
  bool isHttpClientError() => code >= 400 && code < 500;
  bool isTooManyRequests() => code == 429;
  @override
  String toString() => 'HttpClientException: $code $description';
}
