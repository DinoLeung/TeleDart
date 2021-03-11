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

/// This object contains information about one member of a chat.
///
/// https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMember {
  User user;
  String status;
  String custom_title;
  bool is_anonymous;
  bool can_be_edited;
  bool can_manage_chat;
  bool can_post_messages;
  bool can_edit_messages;
  bool can_delete_messages;
  bool can_manage_voice_chats;
  bool can_restrict_members;
  bool can_promote_members;
  bool can_change_info;
  bool can_invite_users;
  bool can_pin_messages;
  bool is_member;
  bool can_send_messages;
  bool can_send_media_messages;
  bool can_send_polls;
  bool can_send_other_messages;
  bool can_add_web_page_previews;
  int until_date;

  ChatMember({
    this.user,
    this.status,
    this.custom_title,
    this.is_anonymous,
    this.can_be_edited,
    this.can_manage_chat,
    this.can_post_messages,
    this.can_edit_messages,
    this.can_delete_messages,
    this.can_manage_voice_chats,
    this.can_restrict_members,
    this.can_promote_members,
    this.can_change_info,
    this.can_invite_users,
    this.can_pin_messages,
    this.is_member,
    this.can_send_messages,
    this.can_send_media_messages,
    this.can_send_polls,
    this.can_send_other_messages,
    this.can_add_web_page_previews,
    this.until_date,
  });

  @JsonKey(ignore: true)
  DateTime get until_date_ => TimeHelper.toDateTime(until_date);
  set until_date_(DateTime dateTime) =>
      until_date = TimeHelper.toUnixTime(dateTime);

  factory ChatMember.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMemberToJson(this);
}
