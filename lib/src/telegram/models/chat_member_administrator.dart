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

/// Represents a [chat member] that has some additional privileges.
///
/// https://core.telegram.org/bots/api#chatmemberadministrator
///
/// [chat member]: https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMemberAdministrator implements ChatMember {
  @override
  String status;
  @override
  User user;
  bool can_be_edited;
  bool is_anonymous;
  bool can_manage_chat;
  bool can_delete_messages;
  bool can_manage_video_chats;
  bool can_restrict_members;
  bool can_promote_members;
  bool can_change_info;
  bool can_invite_users;
  bool? can_post_messages;
  bool? can_edit_messages;
  bool? can_pin_messages;
  bool? can_manage_topics;
  String? custom_title;

  ChatMemberAdministrator({
    required this.status,
    required this.user,
    this.can_be_edited = false,
    this.is_anonymous = false,
    this.can_manage_chat = false,
    this.can_delete_messages = false,
    this.can_manage_video_chats = false,
    this.can_restrict_members = false,
    this.can_promote_members = false,
    this.can_change_info = false,
    this.can_invite_users = false,
    this.can_post_messages,
    this.can_edit_messages,
    this.can_pin_messages,
    this.can_manage_topics,
    this.custom_title,
  });

  factory ChatMemberAdministrator.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberAdministratorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChatMemberAdministratorToJson(this);
}
