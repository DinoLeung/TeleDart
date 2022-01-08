/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2022  Dino PH Leung
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

/// Represents a join request sent to a chat.
///
/// https://core.telegram.org/bots/api#chatjoinrequest
@JsonSerializable()
class ChatJoinRequest {
  Chat chat;
  User from;
  int date;
  String? bio;
  ChatInviteLink? invite_link;

  ChatJoinRequest({
    required this.chat,
    required this.from,
    required this.date,
    this.bio,
    this.invite_link,
  });

  @JsonKey(ignore: true)
  DateTime get date_ => TimeHelper.toDateTime(date);
  set date_(DateTime dateTime) => date = TimeHelper.toUnixTime(dateTime);

  factory ChatJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatJoinRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatJoinRequestToJson(this);
}
