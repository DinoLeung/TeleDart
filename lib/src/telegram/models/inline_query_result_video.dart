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

/// Represents a link to a page containing an embedded video player or a video file.
///
/// By default, this video file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the video.
///
/// If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube),
/// you **must** replace its content using *inputMessageContent*.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultVideo implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String videoUrl;
  String mimeType;
  String thumbUrl;
  String title;
  String? caption;
  String? parseMode;
  int? videoWidth;
  int? videoHeight;
  int? videoDuration;
  String? description;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultVideo({
    required this.id,
    this.type = InlineQueryResult.typeVideo,
    required this.videoUrl,
    required this.mimeType,
    required this.thumbUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.videoWidth,
    this.videoHeight,
    this.videoDuration,
    this.description,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @JsonKey(ignore: true)
  Duration? get videoDuration_ =>
      videoDuration == null ? null : TimeHelper.toDuration(videoDuration!);
  set videoDuration_(Duration? duration) =>
      videoDuration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);
}
