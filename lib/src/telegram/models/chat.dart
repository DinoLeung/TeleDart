/*
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
@JsonSerializable()
class Chat {
  static const PRIVATE = 'private';
  static const GROUP = 'group';
  static const SUPERGROUP = 'supergroup';
  static const CHANNEL = 'channel';

  int id;
  String type;
  String? title;
  String? username;
  String? first_name;
  String? last_name;
  bool? is_forum;
  ChatPhoto? photo;
  List<String>? active_usernames;
  String? emoji_status_custom_emoji_id;
  String? bio;
  bool? has_private_forwards;
  bool? has_restricted_voice_and_video_messages;
  bool? join_to_send_messages;
  bool? join_by_request;
  String? description;
  String? invite_link;
  Message? pinned_message;
  ChatPermissions? permissions;
  int? slow_mode_delay;
  int? message_auto_delete_time;
  bool? has_aggressive_anti_spam_enabled;
  bool? has_hidden_members;
  bool? has_protected_content;
  String? sticker_set_name;
  bool? can_set_sticker_set;
  int? linked_chat_id;
  ChatLocation? location;

  Chat({
    required this.id,
    required this.type,
    this.title,
    this.username,
    this.first_name,
    this.last_name,
    this.is_forum,
    this.photo,
    this.active_usernames,
    this.emoji_status_custom_emoji_id,
    this.bio,
    this.has_private_forwards,
    this.has_restricted_voice_and_video_messages,
    this.join_to_send_messages,
    this.join_by_request,
    this.description,
    this.invite_link,
    this.pinned_message,
    this.permissions,
    this.slow_mode_delay,
    this.message_auto_delete_time,
    this.has_aggressive_anti_spam_enabled,
    this.has_hidden_members,
    this.has_protected_content,
    this.sticker_set_name,
    this.can_set_sticker_set,
    this.linked_chat_id,
    this.location,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
