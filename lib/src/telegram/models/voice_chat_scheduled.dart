/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2021  Dino PH Leung
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

/// This object represents a service message about a voice chat scheduled in the chat.
///
/// https://core.telegram.org/bots/api#voicechatscheduled
@JsonSerializable(fieldRename: FieldRename.snake)
class VoiceChatScheduled {
  int startDate;

  VoiceChatScheduled(this.startDate);

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime get startDate_ => TimeHelper.toDateTime(startDate);
  set startDate_(DateTime dateTime) =>
      startDate = TimeHelper.toUnixTime(dateTime);

  factory VoiceChatScheduled.fromJson(Map<String, dynamic> json) =>
      _$VoiceChatScheduledFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceChatScheduledToJson(this);
}
