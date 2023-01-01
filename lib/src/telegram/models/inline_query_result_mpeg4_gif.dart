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

/// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
///
/// By default, this animated MPEG-4 file will be sent by the user with optional caption.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String mpeg4Url;
  int? mpeg4Width;
  int? mpeg4Height;
  int? mpeg4Duration;
  String thumbUrl;
  String? thumbMimeType;
  String? title;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultMpeg4Gif({
    required this.id,
    this.type = InlineQueryResult.typeMpeg4Gif,
    required this.mpeg4Url,
    this.mpeg4Width,
    this.mpeg4Height,
    this.mpeg4Duration,
    required this.thumbUrl,
    this.thumbMimeType,
    this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @JsonKey(ignore: true)
  Duration? get mpeg4Duration_ =>
      mpeg4Duration == null ? null : TimeHelper.toDuration(mpeg4Duration!);
  set mpeg4Duration_(Duration? duration) =>
      mpeg4Duration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultMpeg4GifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);
}
