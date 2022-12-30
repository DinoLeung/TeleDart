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

/// This object represents a service message about a new forum topic created in the chat.
///
/// https://core.telegram.org/bots/api#forumtopiccreated
@JsonSerializable()
class ForumTopicCreated {
  String name;
  int icon_color;
  String? icon_custom_emoji_id;
  ForumTopicCreated({
    required this.name,
    required this.icon_color,
    this.icon_custom_emoji_id,
  });
  factory ForumTopicCreated.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicCreatedFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicCreatedToJson(this);
}
