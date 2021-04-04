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

/// Represents a link to a page containing an embedded video player or a video file.
/// By default, this video file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the video.
///
/// If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube),
/// you **must** replace its content using *input_message_content*.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable()
class InlineQueryResultVideo implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? video_url;
  String? mime_type;
  String? thumb_url;
  String? title;
  String? caption;
  String? parse_mode;
  int? video_width;
  int? video_height;
  int? video_duration;
  String? description;
  List<MessageEntity>? caption_entities;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;

  InlineQueryResultVideo({
    this.id,
    this.type = 'video',
    this.video_url,
    this.mime_type,
    this.thumb_url,
    this.title,
    this.caption,
    this.parse_mode,
    this.video_width,
    this.video_height,
    this.video_duration,
    this.description,
    this.caption_entities,
    this.reply_markup,
    this.input_message_content,
  });

  @JsonKey(ignore: true)
  Duration get video_duration_ => TimeHelper.toDuration(video_duration ?? 0);
  set video_duration_(Duration duration) =>
      video_duration = TimeHelper.toSeconds(duration);

  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);
}
