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

/// Represents a [chat member] that is under certain restrictions in the chat. Supergroups only.
///
/// that is under certain restrictions in the chat. Supergroups only.
///
/// [chat member]: https://core.telegram.org/bots/api#chatmember

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatMemberRestricted implements ChatMember {
  @override
  String status;
  @override
  User user;
  bool isMember;
  bool canChangeInfo;
  bool canInviteUsers;
  bool canPinMessages;
  bool canManageTopics;
  bool canSendMessages;
  bool canSendMediaMessages;
  bool canSendPolls;
  bool canSendOtherMessages;
  bool canAddWebPagePreviews;
  int untilDate;

  ChatMemberRestricted({
    required this.status,
    required this.user,
    this.isMember = false,
    this.canChangeInfo = false,
    this.canInviteUsers = false,
    this.canPinMessages = false,
    this.canManageTopics = false,
    this.canSendMessages = false,
    this.canSendMediaMessages = false,
    this.canSendPolls = false,
    this.canSendOtherMessages = false,
    this.canAddWebPagePreviews = false,
    required this.untilDate,
  });

  @JsonKey(includeFromJson: true)
  DateTime get untilDate_ => TimeHelper.toDateTime(untilDate);
  set untilDate_(DateTime dateTime) =>
      untilDate = TimeHelper.toUnixTime(dateTime);

  factory ChatMemberRestricted.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberRestrictedFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChatMemberRestrictedToJson(this);
}
