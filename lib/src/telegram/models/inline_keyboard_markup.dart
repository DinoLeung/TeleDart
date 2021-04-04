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

/// This object represents an [inline keyboard] that appears right next to the message it belongs to.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016. Older clients
/// will display *unsupported message*.
///
/// https://core.telegram.org/bots/api#inlinekeyboardmarkup
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
@JsonSerializable()
class InlineKeyboardMarkup implements ReplyMarkup {
  List<List<InlineKeyboardButton>>? inline_keyboard;
  InlineKeyboardMarkup({
    this.inline_keyboard,
  });
  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardMarkupFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineKeyboardMarkupToJson(this);
}
