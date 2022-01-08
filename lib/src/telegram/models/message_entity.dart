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

/// This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
///
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable()
class MessageEntity {
  static const String MENTION = 'mention';
  static const String HASHTAG = 'hashtag';
  static const String CASHTAG = 'cashtag';
  static const String BOT_COMMAND = 'bot_command';
  static const String URL = 'url';
  static const String EMAIL = 'email';
  static const String PHONE_NUMBER = 'phone_number';
  static const String BOLD = 'bold';
  static const String ITALIC = 'italic';
  static const String UNDERLINE = 'underline';
  static const String STRIKETHROUGH = 'strikethrough';
  static const String SPOILER = 'spoiler';
  static const String CODE = 'code';
  static const String PRE = 'pre';
  static const String TEXT_LINK = 'text_link';
  static const String TEXT_MENTION = 'text_mention';

  String type;
  int offset;
  int length;
  String? url;
  User? user;
  String? language;
  MessageEntity({
    required this.type,
    required this.offset,
    required this.length,
    this.url,
    this.user,
    this.language,
  });
  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
