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

/// Represents a [result] of an inline query that was chosen by the user and sent to their chat partner.
///
/// **Note:** It is necessary to enable [inline feedback] via [@Botfather] in order to receive these objects in updates.
///
/// https://core.telegram.org/bots/api#choseninlineresult
///
/// [result]: https://core.telegram.org/bots/api#inlinequeryresult
/// [inline feedback]: https://core.telegram.org/bots/inline#collecting-feedback
/// [@Botfather]: https://t.me/botfather
@JsonSerializable()
class ChosenInlineResult {
  String? result_id;
  User? from;
  Location? location;
  String? inline_message_id;
  String? query;
  ChosenInlineResult({
    this.result_id,
    this.from,
    this.location,
    this.inline_message_id,
    this.query,
  });
  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) =>
      _$ChosenInlineResultFromJson(json);
  Map<String, dynamic> toJson() => _$ChosenInlineResultToJson(this);
}
