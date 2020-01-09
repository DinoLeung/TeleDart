/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2019  Dino PH Leung
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

/// This object represents a chat.
///
/// https://core.telegram.org/bots/api#chat
///
/// The field `all_members_are_administrators` is deprecated.
/// The field is still returned in the object for backward compatibility, but new bots should use the `permissions` field instead.
/// See: https://core.telegram.org/bots/api#july-29-2019
@JsonSerializable()
class Chat {
  int id;
  String type;
  String title;
  String username;
  String first_name;
  String last_name;
  bool all_members_are_administrators;
  ChatPhoto photo;
  String description;
  String invite_link;
  Message pinned_message;
  ChatPermissions permissions;
  int slow_mode_delay;
  String sticker_set_name;
  bool can_set_sticker_set;
  Chat(
      {this.id,
      this.type,
      this.title,
      this.username,
      this.first_name,
      this.last_name,
      this.all_members_are_administrators,
      this.photo,
      this.description,
      this.invite_link,
      this.pinned_message,
      this.permissions,
      this.slow_mode_delay,
      this.sticker_set_name,
      this.can_set_sticker_set});
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
