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

/// Object for an [inline keyboard], [custom reply keyboard], instructions to remove reply keyboard or to force a reply from the user.
///
/// * [ReplyKeyboardMarkup](https://core.telegram.org/bots/api#replykeyboardmarkup)
/// * [ReplyKeyboardRemove](https://core.telegram.org/bots/api#replykeyboardremove)
/// * [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
/// * [ForceReply](https://core.telegram.org/bots/api#forcereply)
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [custom reply keyboard]: https://core.telegram.org/bots#keyboards
@JsonSerializable()
class ReplyMarkup {
  ReplyMarkup();
  factory ReplyMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}
