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

/// Represents a link to a video file stored on the Telegram servers.
/// By default, this video file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the video.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
@JsonSerializable()
class InlineQueryResultCachedVideo implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? video_file_id;
  String? title;
  String? description;
  String? caption;
  String? parse_mode;
  List<MessageEntity>? caption_entities;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;
  InlineQueryResultCachedVideo({
    this.id,
    this.type = 'video',
    this.video_file_id,
    this.title,
    this.description,
    this.caption,
    this.parse_mode,
    this.caption_entities,
    this.reply_markup,
    this.input_message_content,
  });
  factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVideoToJson(this);
}
