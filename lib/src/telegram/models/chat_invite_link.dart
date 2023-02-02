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

/// Represents an invite link for a chat.
///
/// https://core.telegram.org/bots/api#chatinvitelink
@JsonSerializable(fieldRename: FieldRename.snake)
class ChatInviteLink {
  String inviteLink;
  User creator;
  bool createsJoinRequest;
  bool isPrimary;
  bool isRevoked;
  String? name;
  int? expireDate;
  int? memberLimit;
  int? pendingJoinRequestCount;

  ChatInviteLink({
    required this.inviteLink,
    required this.creator,
    required this.createsJoinRequest,
    required this.isPrimary,
    required this.isRevoked,
    this.name,
    this.expireDate,
    this.memberLimit,
    this.pendingJoinRequestCount,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get expireDate_ =>
      expireDate == null ? null : TimeHelper.toDateTime(expireDate!);
  set expireDate_(DateTime? dateTime) =>
      expireDate = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);

  factory ChatInviteLink.fromJson(Map<String, dynamic> json) =>
      _$ChatInviteLinkFromJson(json);
  Map<String, dynamic> toJson() => _$ChatInviteLinkToJson(this);
}
