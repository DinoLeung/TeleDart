/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2021  Dino PH Leung
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

/// This object represents a service message about a change in auto-delete timer settings.
///
/// https://core.telegram.org/bots/api#messageautodeletetimerchanged
@JsonSerializable()
class MessageAutoDeleteTimerChanged {
  int message_auto_delete_time;

  MessageAutoDeleteTimerChanged({this.message_auto_delete_time});

  @JsonKey(ignore: true)
  Duration get message_auto_delete_time_ =>
      TimeHelper.toDuration(message_auto_delete_time);
  set message_auto_delete_time_(Duration duration) =>
      message_auto_delete_time = TimeHelper.toSeconds(duration);

  factory MessageAutoDeleteTimerChanged.fromJson(Map<String, dynamic> json) =>
      _$MessageAutoDeleteTimerChangedFromJson(json);

  Map<String, dynamic> toJson() => _$MessageAutoDeleteTimerChangedToJson(this);
}
