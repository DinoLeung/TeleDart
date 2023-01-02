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
@JsonSerializable(fieldRename: FieldRename.snake)
class MessageEntity {
  static const typeMention = 'mention';
  static const typeHashtag = 'hashtag';
  static const typeCashtag = 'cashtag';
  static const typeBotCommand = 'bot_command';
  static const typeUrl = 'url';
  static const typeEmail = 'email';
  static const typePhoneNmber = 'phone_number';
  static const typeBold = 'bold';
  static const typeItalic = 'italic';
  static const typeUnderline = 'underline';
  static const typeStrikethrough = 'strikethrough';
  static const typeSpolier = 'spoiler';
  static const typeCode = 'code';
  static const typePre = 'pre';
  static const typeTextLink = 'text_link';
  static const typeTextMention = 'text_mention';
  static const typeCustomEmoji = 'custom_emoji';

  String type;
  int offset;
  int length;
  String? url;
  User? user;
  String? language;
  String? customEmojiId;
  MessageEntity({
    required this.type,
    required this.offset,
    required this.length,
    this.url,
    this.user,
    this.language,
    this.customEmojiId,
  });
  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
