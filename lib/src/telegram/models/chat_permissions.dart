/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of '../model.dart';

/// Describes actions that a non-administrator user is allowed to take in a chat.
///
/// https://core.telegram.org/bots/api#chatpermissions
@JsonSerializable()
class ChatPermissions {
  bool? can_send_messages;
  bool? can_send_media_messages;
  bool? can_send_polls;
  bool? can_send_other_messages;
  bool? can_add_web_page_previews;
  bool? can_change_info;
  bool? can_invite_users;
  bool? can_pin_messages;
  ChatPermissions({
    this.can_send_messages,
    this.can_send_media_messages,
    this.can_send_polls,
    this.can_send_other_messages,
    this.can_add_web_page_previews,
    this.can_change_info,
    this.can_invite_users,
    this.can_pin_messages,
  });
  factory ChatPermissions.fromJson(Map<String, dynamic> json) =>
      _$ChatPermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPermissionsToJson(this);
}
