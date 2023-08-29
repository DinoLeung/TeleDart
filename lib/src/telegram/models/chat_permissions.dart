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

// can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes

part of '../model.dart';

/// Describes actions that a non-administrator user is allowed to take in a chat.
///
/// https://core.telegram.org/bots/api#chatpermissions
@JsonSerializable(fieldRename: FieldRename.snake)
class ChatPermissions {
  bool? canSendMessages;
  bool? canSendAudios;
  bool? canSendDocuments;
  bool? canSendPhotos;
  bool? canSendVideos;
  bool? canSendVideoNotes;
  bool? canSendVoiceNotes;
  bool? canSendPolls;
  bool? canSendOtherMessages;
  bool? canAddWebPagePreviews;
  bool? canChangeInfo;
  bool? canInviteUsers;
  bool? canPinMessages;
  bool? canManageTopics;

  ChatPermissions({
    this.canSendMessages,
    this.canSendAudios,
    this.canSendDocuments,
    this.canSendPhotos,
    this.canSendVideos,
    this.canSendVideoNotes,
    this.canSendVoiceNotes,
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
