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

/// This object represents changes in the status of a chat member.
///
/// https://core.telegram.org/bots/api#chatmemberupdated
@JsonSerializable()
class ChatMemberUpdated {
  Chat chat;
  User from;
  int date;
  ChatMember old_chat_member;
  ChatMember new_chat_member;
  ChatInviteLink invite_link;

  ChatMemberUpdated({
    this.chat,
    this.from,
    this.old_chat_member,
    this.new_chat_member,
    this.invite_link,
  });

  @JsonKey(ignore: true)
  DateTime get date_ => TimeHelper.toDateTime(date);
  set date_(DateTime dateTime) => date = TimeHelper.toUnixTime(dateTime);

  factory ChatMemberUpdated.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberUpdatedFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMemberUpdatedToJson(this);
}
