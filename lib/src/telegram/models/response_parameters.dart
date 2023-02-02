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

part of '../model.dart';

/// Contains information about why a request was unsuccessful.
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable(fieldRename: FieldRename.snake)
class ResponseParameters {
  int? migrateToChatId;
  int? retryAfter;

  ResponseParameters({
    this.migrateToChatId,
    this.retryAfter,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get retryAfter_ =>
      retryAfter == null ? null : TimeHelper.toDuration(retryAfter!);
  set retryAfter_(Duration? duration) =>
      retryAfter = duration == null ? null : TimeHelper.toSeconds(duration);

  factory ResponseParameters.fromJson(Map<String, dynamic> json) =>
      _$ResponseParametersFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseParametersToJson(this);
}
