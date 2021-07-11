/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2021  Dino PH Leung
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

/// Represents a [chat member] that is under certain restrictions in the chat. Supergroups only.
///
/// that is under certain restrictions in the chat. Supergroups only.
///
/// [chat member]: https://core.telegram.org/bots/api#chatmember

@JsonSerializable()
class ChatMemberRestricted implements ChatMember {
  @override
  String status;
  @override
  User user;
  bool is_member;
  bool can_change_info;
  bool can_invite_users;
  bool can_pin_messages;
  bool can_send_messages;
  bool can_send_media_messages;
  bool can_send_polls;
  bool can_send_other_messages;
  bool can_add_web_page_previews;
  int until_date;

  ChatMemberRestricted({
    required this.status,
    required this.user,
    this.is_member = false,
    this.can_change_info = false,
    this.can_invite_users = false,
    this.can_pin_messages = false,
    this.can_send_messages = false,
    this.can_send_media_messages = false,
    this.can_send_polls = false,
    this.can_send_other_messages = false,
    this.can_add_web_page_previews = false,
    required this.until_date,
  });

  @JsonKey(ignore: true)
  DateTime get until_date_ => TimeHelper.toDateTime(until_date);
  set until_date_(DateTime dateTime) =>
      until_date = TimeHelper.toUnixTime(dateTime);

  factory ChatMemberRestricted.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberRestrictedFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChatMemberRestrictedToJson(this);
}
