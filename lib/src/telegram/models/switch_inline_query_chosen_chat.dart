part of '../model.dart';

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

/// This object represents an inline button that switches the current user to inline mode in a chosen chat, with an optional default inline query.
///
/// https://core.telegram.org/bots/api#inlinequeryresultsbutton
@JsonSerializable(fieldRename: FieldRename.snake)
class SwitchInlineQueryChosenChat {
  final String? query;

  final bool? allowUserChats;

  final bool? allowBotChats;

  final bool? allowGroupChats;

  final bool? allowChannelChats;

  const SwitchInlineQueryChosenChat({
    this.query,
    this.allowUserChats,
    this.allowBotChats,
    this.allowGroupChats,
    this.allowChannelChats,
  });

  factory SwitchInlineQueryChosenChat.fromJson(Map<String, dynamic> json) =>
      _$SwitchInlineQueryChosenChatFromJson(json);

  Map<String, dynamic> toJson() => _$SwitchInlineQueryChosenChatToJson(this);
}
