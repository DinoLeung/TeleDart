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

/// This object represents the content of a media message to be sent which contains thumbnail.
///
/// It should be one of
/// * [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
/// * [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
/// * [InputMediaAudio](https://core.telegram.org/bots/api#inputmediaaudio)
/// * [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable(fieldRename: FieldRename.snake)
class InputMediaWithThumbnail implements InputMedia {
  @override
  String type;
  @override
  String media;
  @override
  String? caption;
  @override
  String? parseMode;
  @override
  List<MessageEntity>? captionEntities;
  String? thumbnail;

  @JsonKey(includeFromJson: false, includeToJson: false)
  MultipartFile? thumbnailFile;

  InputMediaWithThumbnail({
    required this.type,
    required this.media,
    this.thumbnail,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.thumbnailFile,
  });

  factory InputMediaWithThumbnail.fromJson(Map<String, dynamic> json) =>
      _$InputMediaWithThumbnailFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaWithThumbnailToJson(this);
}
