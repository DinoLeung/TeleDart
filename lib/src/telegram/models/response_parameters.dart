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

part of '../model.dart';

/// Contains information about why a request was unsuccessful.
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable()
class ResponseParameters {
  int? migrate_to_chat_id;
  int? retry_after;

  ResponseParameters({
    this.migrate_to_chat_id,
    this.retry_after,
  });

  @JsonKey(ignore: true)
  Duration get retry_after_ => TimeHelper.toDuration(retry_after ?? 0);
  set retry_after_(Duration duration) =>
      retry_after = TimeHelper.toSeconds(duration);

  factory ResponseParameters.fromJson(Map<String, dynamic> json) =>
      _$ResponseParametersFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseParametersToJson(this);
}
