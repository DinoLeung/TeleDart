/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2020  Dino PH Leung
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

/// This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed.
///
/// https://core.telegram.org/bots/api#pollanswer
@JsonSerializable()
class PollAnswer {
  String? poll_id;
  User? user;
  List<int>? option_ids;
  PollAnswer({
    this.poll_id,
    this.user,
    this.option_ids,
  });
  factory PollAnswer.fromJson(Map<String, dynamic> json) =>
      _$PollAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$PollAnswerToJson(this);
}
