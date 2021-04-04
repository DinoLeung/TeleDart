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

/// Upon receiving a message with this object,
/// Telegram clients will remove the current custom keyboard and display the default letter-keyboard.
/// By default, custom keyboards are displayed until a new keyboard is sent by a bot.
/// An exception is made for one-time keyboards that are hidden immediately after the user presses a
/// button (see [ReplyKeyboardMarkup]).
///
/// https://core.telegram.org/bots/api#replykeyboardremove
///
/// [ReplyKeyboardMarkup]: https://core.telegram.org/bots/api#replykeyboardmarkup
@JsonSerializable()
class ReplyKeyboardRemove implements ReplyMarkup {
  bool? remove_keyboard;
  bool? selective;
  ReplyKeyboardRemove({
    this.remove_keyboard,
    this.selective,
  });
  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardRemoveFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}
