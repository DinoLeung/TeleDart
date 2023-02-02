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

/// This object represents a video file.
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable(fieldRename: FieldRename.snake)
class Video {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int duration;
  PhotoSize? thumb;
  String? fileName;
  String? mimeType;
  int? fileSize;

  Video({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.duration,
    this.thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration get duration_ => TimeHelper.toDuration(duration);
  set duration_(Duration duration) =>
      this.duration = TimeHelper.toSeconds(duration);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
