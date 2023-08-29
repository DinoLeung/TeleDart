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

/// This object defines the criteria used to request a suitable chat.
/// The identifier of the selected chat will be shared with the bot when
/// the corresponding button is pressed.
///
/// https://core.telegram.org/bots/api#keyboardbuttonrequestchat
@JsonSerializable(fieldRename: FieldRename.snake)
class KeyboardButtonRequestChat {
  int requestId;
  bool chatIsChannel;
  bool? charIsForum;
  bool? chatHasUsername;
  bool? chatIsCreated;
  ChatAdministratorRights? userAdministratorRights;
  ChatAdministratorRights? botAdministratorRights;
  bool? botIsMember;
  KeyboardButtonRequestChat({
    required this.requestId,
    required this.chatIsChannel,
    this.charIsForum,
    this.chatHasUsername,
    this.chatIsCreated,
    this.userAdministratorRights,
    this.botAdministratorRights,
    this.botIsMember,
  });
  factory KeyboardButtonRequestChat.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonRequestChatFromJson(json);
  Map<String, dynamic> toJson() => _$KeyboardButtonRequestChatToJson(this);
}
