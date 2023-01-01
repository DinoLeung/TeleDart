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

/// Represents a link to a voice message stored on the Telegram servers.
///
/// By default, this voice message will be sent by the user.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the voice message.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultCachedVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voiceFileId;
  String title;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  InlineQueryResultCachedVoice({
    required this.id,
    this.type = InlineQueryResult.typeVoice,
    required this.voiceFileId,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });
  factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVoiceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVoiceToJson(this);
}
