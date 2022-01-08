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

/// Represents a [chat member] that owns the chat and has all administrator privileges.
///
/// https://core.telegram.org/bots/api#chatmemberowner
///
/// [chat member]: https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMemberOwner implements ChatMember {
  @override
  String status;
  @override
  User user;
  bool is_anonymous;
  String? custom_title;

  ChatMemberOwner({
    required this.user,
    required this.status,
    required this.is_anonymous,
    this.custom_title,
  });

  factory ChatMemberOwner.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberOwnerFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChatMemberOwnerToJson(this);
}
