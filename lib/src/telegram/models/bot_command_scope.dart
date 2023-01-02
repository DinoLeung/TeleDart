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

/// This object represents the scope to which bot commands are applied.
///
/// Currently, the following 7 scopes are supported:
/// * [BotCommandScopeDefault](https://core.telegram.org/bots/api#botcommandscopedefault)
/// * [BotCommandScopeAllPrivateChats](https://core.telegram.org/bots/api#botcommandscopeallprivatechats)
/// * [BotCommandScopeAllGroupChats](https://core.telegram.org/bots/api#botcommandscopeallgroupchats)
/// * [BotCommandScopeAllChatAdministrators](https://core.telegram.org/bots/api#botcommandscopeallchatadministrators)
/// * [BotCommandScopeChat](https://core.telegram.org/bots/api#botcommandscopechat)
/// * [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
/// * [BotCommandScopeChatMember](https://core.telegram.org/bots/api#botcommandscopechatmember)
///
/// https://core.telegram.org/bots/api#botcommandscope
@JsonSerializable(fieldRename: FieldRename.snake)
abstract class BotCommandScope {
  static const typeDefault = 'default';
  static const typeAllPrivateChats = 'all_private_chats';
  static const typeAllGroupChats = 'all_group_chats';
  static const typeAllChatAdministrators = 'all_chat_administrators';
  static const typeChat = 'chat';
  static const typeChatAdministrators = 'chat_administrators';
  static const typeChatMember = 'chat_member';

  String type;

  BotCommandScope({required this.type});

  factory BotCommandScope.fromJson(Map<String, dynamic> json) =>
      _$BotCommandScopeFromJson(json);

  Map<String, dynamic> toJson();
}
