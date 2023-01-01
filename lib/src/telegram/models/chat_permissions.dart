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

/// Describes actions that a non-administrator user is allowed to take in a chat.
///
/// https://core.telegram.org/bots/api#chatpermissions
@JsonSerializable(fieldRename: FieldRename.snake)
class ChatPermissions {
  bool? canSendMessages;
  bool? canSendMediaMessages;
  bool? canSendPolls;
  bool? canSendOtherMessages;
  bool? canAddWebPagePreviews;
  bool? canChangeInfo;
  bool? canInviteUsers;
  bool? canPinMessages;
  bool? canManageTopics;

  ChatPermissions({
    this.canSendMessages,
    this.canSendMediaMessages,
    this.canSendPolls,
    this.canSendOtherMessages,
    this.canAddWebPagePreviews,
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPinMessages,
    this.canManageTopics,
  });

  factory ChatPermissions.fromJson(Map<String, dynamic> json) =>
      _$ChatPermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPermissionsToJson(this);
}
