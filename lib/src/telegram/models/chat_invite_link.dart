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

/// Represents an invite link for a chat.
///
/// https://core.telegram.org/bots/api#chatinvitelink
@JsonSerializable()
class ChatInviteLink {
  String invite_link;
  User creator;
  bool is_primary;
  bool is_revoked;
  int? expire_date;
  int? member_limit;

  ChatInviteLink({
    required this.invite_link,
    required this.creator,
    required this.is_primary,
    required this.is_revoked,
    this.expire_date,
    this.member_limit,
  });

  @JsonKey(ignore: true)
  DateTime? get expire_date_ =>
      expire_date == null ? null : TimeHelper.toDateTime(expire_date!);
  set expire_date_(DateTime? dateTime) =>
      expire_date = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);

  factory ChatInviteLink.fromJson(Map<String, dynamic> json) =>
      _$ChatInviteLinkFromJson(json);
  Map<String, dynamic> toJson() => _$ChatInviteLinkToJson(this);
}
