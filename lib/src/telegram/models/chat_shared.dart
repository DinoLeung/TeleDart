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

/// This object contains information about the chat whose identifier was
/// shared with the bot using a [KeyboardButtonRequestChat] button.
///
/// https://core.telegram.org/bots/api#chatshared
@JsonSerializable(fieldRename: FieldRename.snake)
class ChatShared {
  int requestId;
  int userId;
  ChatShared({
    required this.requestId,
    required this.userId,
  });
  factory ChatShared.fromJson(Map<String, dynamic> json) =>
      _$ChatSharedFromJson(json);
  Map<String, dynamic> toJson() => _$ChatSharedToJson(this);
}
