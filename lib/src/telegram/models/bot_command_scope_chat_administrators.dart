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

/// Represents the [scope] of bot commands, covering all administrators of a specific group or supergroup chat.
///
/// https://core.telegram.org/bots/api#botcommandscopechatadministrators
///
/// [scope]: https://core.telegram.org/bots/api#botcommandscope
@JsonSerializable()
class BotCommandScopeChatAdministrators implements BotCommandScope {
  @override
  String type;
  dynamic chat_id;

  BotCommandScopeChatAdministrators({
    this.type = BotCommandScope.CHAT_ADMINISTRATORS,
    required this.chat_id,
  });

  factory BotCommandScopeChatAdministrators.fromJson(
          Map<String, dynamic> json) =>
      _$BotCommandScopeChatAdministratorsFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$BotCommandScopeChatAdministratorsToJson(this);
}
