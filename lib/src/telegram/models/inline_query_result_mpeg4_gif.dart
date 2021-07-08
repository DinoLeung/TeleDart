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

/// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
/// By default, this animated MPEG-4 file will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable()
class InlineQueryResultMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String mpeg4_url;
  int? mpeg4_width;
  int? mpeg4_height;
  int? mpeg4_duration;
  String thumb_url;
  String? thumb_mime_type;
  String? title;
  String? caption;
  String? parse_mode;
  List<MessageEntity>? caption_entities;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;

  InlineQueryResultMpeg4Gif({
    required this.id,
    this.type = InlineQueryResult.MPEG4_GIF,
    required this.mpeg4_url,
    this.mpeg4_width,
    this.mpeg4_height,
    this.mpeg4_duration,
    required this.thumb_url,
    this.thumb_mime_type,
    this.title,
    this.caption,
    this.parse_mode,
    this.caption_entities,
    this.reply_markup,
    this.input_message_content,
  });

  @JsonKey(ignore: true)
  Duration? get mpeg4_duration_ => mpeg4_duration == null
      ? null
      : TimeHelper.toDuration(mpeg4_duration!);
  set mpeg4_duration_(Duration? duration) =>
      mpeg4_duration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultMpeg4GifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);
}
