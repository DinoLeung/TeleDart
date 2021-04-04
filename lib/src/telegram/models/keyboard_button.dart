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

/// This object represents one button of the reply keyboard.
/// For simple text buttons String can be used instead of this object to specify text of the button.
/// Optional fields are mutually exclusive.
///
/// **Note:** request_contact and request_location options will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
///
/// **Note:** request_poll option will only work in Telegram versions released after 23 January, 2020. Older clients will display unsupported message.
///
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable()
class KeyboardButton {
  String? text;
  bool? request_contact;
  bool? request_location;
  KeyboardButtonPollType? request_poll;
  KeyboardButton({
    this.text,
    this.request_contact,
    this.request_location,
    this.request_poll,
  });
  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);
  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}
