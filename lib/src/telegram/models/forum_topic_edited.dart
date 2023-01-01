/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2023  Dino PH Leung
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

/// This object represents a service message about an edited forum topic.
///
/// https://core.telegram.org/bots/api#forumtopicedited
@JsonSerializable(fieldRename: FieldRename.snake)
class ForumTopicEdited {
  String? name;
  String? iconCustomEmojiId;
  ForumTopicEdited({
    this.name,
    this.iconCustomEmojiId,
  });
  factory ForumTopicEdited.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicEditedFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicEditedToJson(this);
}
