/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2022  Dino PH Leung
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

/// This object describes the bot's menu button in a private chat. It should be one of
/// - [MenuButtonCommands]
/// - [MenuButtonWebApp]
/// - [MenuButtonDefault]
///
/// If a menu button other than [MenuButtonDefault] is set for a private chat, then it is applied in the chat. Otherwise the default menu button is applied.
/// By default, the menu button opens the list of bot commands
///
/// https://core.telegram.org/bots/api#menubutton

@JsonSerializable(fieldRename: FieldRename.snake)
class MenuButton {
  static const typeCommands = 'commands';
  static const typeWebApp = 'web_app';
  static const typeDefault = 'default';

  String type;
  MenuButton({required this.type});
  factory MenuButton.fromJson(Map<String, dynamic> json) =>
      _$MenuButtonFromJson(json);
  Map<String, dynamic> toJson() => _$MenuButtonToJson(this);
}
