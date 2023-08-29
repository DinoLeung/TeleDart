/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2023  Dino PH Leung
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

/// This object represents the bot's name
///
/// https://core.telegram.org/bots/api#botname
@JsonSerializable(fieldRename: FieldRename.snake)
class BotName {
  String name;
  BotName({
    required this.name,
  });
  factory BotName.fromJson(Map<String, dynamic> json) =>
      _$BotNameFromJson(json);
  Map<String, dynamic> toJson() => _$BotNameToJson(this);
}
