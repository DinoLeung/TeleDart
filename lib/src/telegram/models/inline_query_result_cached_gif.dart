/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of '../model.dart';

/// Represents a link to an animated GIF file stored on the Telegram servers.
/// By default, this animated GIF file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedgif
@JsonSerializable()
class InlineQueryResultCachedGif implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? gif_file_id;
  String? title;
  String? caption;
  String? parse_mode;
  List<MessageEntity>? caption_entities;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;
  InlineQueryResultCachedGif({
    this.id,
    this.type = 'gif',
    this.gif_file_id,
    this.title,
    this.caption,
    this.parse_mode,
    this.caption_entities,
    this.reply_markup,
    this.input_message_content,
  });
  factory InlineQueryResultCachedGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedGifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedGifToJson(this);
}
