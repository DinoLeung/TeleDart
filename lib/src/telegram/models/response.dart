/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2023  Dino PH Leung
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

part of '../model.dart';

/// This object is not explicitly described as an object in the Telegram Bot API.
///
/// The response contains a JSON object, which always has a Boolean field
/// 'ok' and may have an optional String field 'description' with a
/// human-readable description of the result. If 'ok' equals True, the
/// request was successful and the result of the query can be found in the
/// 'result' field. In case of an unsuccessful request, 'ok' equals false
/// and the error is explained in the 'description'. An Integer
/// 'error_code' field is also returned, but its contents are subject to
/// change in the future. Some errors may also have an optional field
/// 'parameters' of the type ResponseParameters, which can help to
/// automatically handle the error.
///
/// https://core.telegram.org/bots/api#making-requests
@JsonSerializable(fieldRename: FieldRename.snake)
class Response {
  bool ok;

  Response({
    required this.ok,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SuccessResponse {
  bool ok;
  dynamic result;

  SuccessResponse({
    required this.ok,
    this.result,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorResponse {
  bool ok;
  String description;
  int errorCode;
  ResponseParameters parameters;

  ErrorResponse({
    required this.ok,
    required this.description,
    required this.errorCode,
    required this.parameters,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
