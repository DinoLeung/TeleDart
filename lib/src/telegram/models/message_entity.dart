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
  static const String typeMention = 'mention';
  static const String typeHashtag = 'hashtag';
  static const String typeCashtag = 'cashtag';
  static const String typeBotCommand = 'botCommand';
  static const String typeUrl = 'url';
  static const String typeEmail = 'email';
  static const String typePhoneNmber = 'phoneNumber';
  static const String typeBold = 'bold';
  static const String typeItalic = 'italic';
  static const String typeUnderline = 'underline';
  static const String typeStrikethrough = 'strikethrough';
  static const String typeSpolier = 'spoiler';
  static const String typeCode = 'code';
  static const String typePre = 'pre';
  static const String typeTextLink = 'textLink';
  static const String typeTextMention = 'textMention';
  static const String typeCustomEmoji = 'customEmoji';

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
