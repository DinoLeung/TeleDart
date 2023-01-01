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

/// This object represents a forum topic.
///
/// https://core.telegram.org/bots/api#forumtopic
@JsonSerializable(fieldRename: FieldRename.snake)
class ForumTopic {
  String messageThreadId;
  String name;
  int iconColor;
  String? iconCustomEmojiId;

  ForumTopic({
    required this.messageThreadId,
    required this.name,
    required this.iconColor,
    this.iconCustomEmojiId,
  });

  factory ForumTopic.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicToJson(this);
}
