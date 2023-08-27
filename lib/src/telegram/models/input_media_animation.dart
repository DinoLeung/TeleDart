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

/// Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaanimation
@JsonSerializable(fieldRename: FieldRename.snake)
class InputMediaAnimation implements InputMediaWithThumbnail {
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
  @override
  String? thumbnail;
  int? width;
  int? height;
  int? duration;
  bool? hasSpoiler;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  MultipartFile? thumbnailFile;

  InputMediaAnimation(
      {this.type = InputMedia.typeAnimation,
      required this.media,
      this.thumbnail,
      this.caption,
      this.parseMode,
      this.captionEntities,
      this.width,
      this.height,
      this.duration,
      this.hasSpoiler,
      this.thumbnailFile,
      });

  // Factory to create InputMediaAnimation with thumbnail file
  factory InputMediaAnimation.withThumbnailFile({
    required io.File thumbnail,
    required String media,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    int? width,
    int? height,
    int? duration,
    bool? hasSpoiler,
  }) =>
      InputMediaAnimation(
        type: InputMedia.typeAnimation,
        media: media,
        thumbnail: 'attach://${thumbnail.path}',
        thumbnailFile: MultipartFile(
            thumbnail.path, thumbnail.openRead(), thumbnail.lengthSync(),
            filename: thumbnail.path.split('/').last),
        caption: caption,
        parseMode: parseMode,
        captionEntities: captionEntities,
        width: width,
        height: height,
        duration: duration,
        hasSpoiler: hasSpoiler,
      );

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get duration_ =>
      duration == null ? null : TimeHelper.toDuration(duration!);
  set duration_(Duration? duration) =>
      this.duration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InputMediaAnimation.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAnimationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaAnimationToJson(this);
}
