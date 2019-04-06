/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2018  Dino PH Leung
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

/// Represents a link to an animated GIF file.
/// By default, this animated GIF file will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable()
class InlineQueryResultGif implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'gif';
  String gif_url;
  int gif_width;
  int gif_height;
  int gif_duration;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultGif(
      {this.id,
      this.type = 'gif',
      this.gif_url,
      this.gif_width,
      this.gif_height,
      this.gif_duration,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGifToJson(this);
}
