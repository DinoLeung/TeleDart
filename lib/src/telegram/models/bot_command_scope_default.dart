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

/// Represents the default [scope] of bot commands.
///
/// Default commands are used if no commands with a [narrower scope] are specified for the user.
///
/// https://core.telegram.org/bots/api#botcommandscopedefault
///
/// [scope]: https://core.telegram.org/bots/api#botcommandscope
/// [narrower scope]: https://core.telegram.org/bots/api#determining-list-of-commands
@JsonSerializable()
class BotCommandScopeDefault implements BotCommandScope {
  @override
  String type;

  BotCommandScopeDefault({this.type = BotCommandScope.DEFAULT});

  factory BotCommandScopeDefault.fromJson(Map<String, dynamic> json) =>
      _$BotCommandScopeDefaultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BotCommandScopeDefaultToJson(this);
}
