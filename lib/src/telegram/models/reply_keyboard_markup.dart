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

/// This object represents a [custom keyboard] with reply options
/// (see [Introduction to bots] for details and examples).
///
/// https://core.telegram.org/bots/api#replykeyboardmarkup
///
/// [custom keyboard]: https://core.telegram.org/bots#keyboards
/// [Introduction to bots]: https://core.telegram.org/bots#keyboards
@JsonSerializable()
class ReplyKeyboardMarkup implements ReplyMarkup {
  List<List<KeyboardButton>>? keyboard;
  bool? resize_keyboard;
  bool? one_time_keyboard;
  bool? selective;
  ReplyKeyboardMarkup({
    this.keyboard,
    this.resize_keyboard,
    this.one_time_keyboard,
    this.selective,
  });
  factory ReplyKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardMarkupFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ReplyKeyboardMarkupToJson(this);
}
