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

/// This object represents a [video message] (available in Telegram apps as of [v.4.0]).
///
/// https://core.telegram.org/bots/api#videonote
///
/// [video message]: https://telegram.org/blog/video-messages-and-telescope
/// [v.4.0]: https://telegram.org/blog/video-messages-and-telescope
@JsonSerializable()
class VideoNote {
  String file_id;
  String file_unique_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;
  VideoNote(
      {this.file_id,
      this.file_unique_id,
      this.length,
      this.duration,
      this.thumb,
      this.file_size});
  factory VideoNote.fromJson(Map<String, dynamic> json) =>
      _$VideoNoteFromJson(json);
  Map<String, dynamic> toJson() => _$VideoNoteToJson(this);
}
