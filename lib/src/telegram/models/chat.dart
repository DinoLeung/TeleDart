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

/// This object represents a chat.
///
/// https://core.telegram.org/bots/api#chat
@JsonSerializable(fieldRename: FieldRename.snake)
class Chat {
  static const typePrivate = 'private';
  static const typeGroup = 'group';
  static const typeSuperGroup = 'supergroup';
  static const typeChannel = 'channel';

  int id;
  String type;
  String? title;
  String? username;
  String? firstName;
  String? lastName;
  bool? isForum;
  ChatPhoto? photo;
  List<String>? activeUsernames;
  String? emojiStatusCustomEmojiId;
  String? bio;
  bool? hasPrivateForwards;
  bool? hasRestrictedVoiceAndVideoMessages;
  bool? joinToSendMessages;
  bool? joinByRequest;
  String? description;
  String? inviteLink;
  Message? pinnedMessage;
  ChatPermissions? permissions;
  int? slowModeDelay;
  int? messageAutoDeleteTime;
  bool? hasAggressiveAntiSpamEnabled;
  bool? hasHiddenMembers;
  bool? hasProtectedContent;
  String? stickerSetName;
  bool? canSetStickerSet;
  int? linkedChatId;
  ChatLocation? location;

  Chat({
    required this.id,
    required this.type,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.isForum,
    this.photo,
    this.activeUsernames,
    this.emojiStatusCustomEmojiId,
    this.bio,
    this.hasPrivateForwards,
    this.hasRestrictedVoiceAndVideoMessages,
    this.joinToSendMessages,
    this.joinByRequest,
    this.description,
    this.inviteLink,
    this.pinnedMessage,
    this.permissions,
    this.slowModeDelay,
    this.messageAutoDeleteTime,
    this.hasAggressiveAntiSpamEnabled,
    this.hasHiddenMembers,
    this.hasProtectedContent,
    this.stickerSetName,
    this.canSetStickerSet,
    this.linkedChatId,
    this.location,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
