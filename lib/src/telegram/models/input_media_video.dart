/**
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
@JsonSerializable()
class InputMediaVideo implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  dynamic thumb; // InputFile or String
  int width;
  int height;
  int duration;
  bool supports_streaming;
  InputMediaVideo({
    this.type = 'video',
    this.media,
    this.caption,
    this.parse_mode,
    this.thumb,
    this.width,
    this.height,
    this.duration,
    this.supports_streaming,
  });
  factory InputMediaVideo.fromJson(Map<String, dynamic> json) =>
      _$InputMediaVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);
}
