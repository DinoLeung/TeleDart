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

/// Represents a video to be sent.
///
/// https://core.telegram.org/bots/api#inputmediavideo
@JsonSerializable(fieldRename: FieldRename.snake)
class InputMediaVideo implements InputMediaWithThumbnail {
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
  bool? supportsStreaming;
  bool? hasSpoiler;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  MultipartFile? thumbnailFile;

  InputMediaVideo({
    this.type = InputMedia.typeVideo,
    required this.media,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.thumbnail,
    this.width,
    this.height,
    this.duration,
    this.supportsStreaming,
    this.hasSpoiler,
    this.thumbnailFile,
  });

  // Factory to create InputMediaVideo with thumbnail file
  factory InputMediaVideo.withThumbnailFile({
    required io.File thumbnail,
    required String media,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    int? width,
    int? height,
    int? duration,
    bool? supportsStreaming,
    bool? hasSpoiler,
  }) =>
      InputMediaVideo(
        type: InputMedia.typeVideo,
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
        supportsStreaming: supportsStreaming,
        hasSpoiler: hasSpoiler,
      );

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get duration_ =>
      duration == null ? null : TimeHelper.toDuration(duration!);
  set duration_(Duration? duration) =>
      this.duration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InputMediaVideo.fromJson(Map<String, dynamic> json) =>
      _$InputMediaVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);
}
