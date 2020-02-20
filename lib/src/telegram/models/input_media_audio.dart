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

/// Represents an audio file to be treated as music to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaaudio
@JsonSerializable()
class InputMediaAudio implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  dynamic thumb; // InputFile or String
  int duration;
  String performer;
  String title;
  InputMediaAudio(
      {this.type = 'audio',
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode,
      this.duration,
      this.performer,
      this.title});
  Duration get duration_ => toDuration(duration);
  set duration_(Duration duration) => this.duration = toSeconds(duration);
  factory InputMediaAudio.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAudioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaAudioToJson(this);
}
