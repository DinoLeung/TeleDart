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

/// This object represents one size of a photo or a [file] / [sticker] thumbnail.
///
/// https://core.telegram.org/bots/api#photosize
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoSize {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int? fileSize;
  PhotoSize({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    this.fileSize,
  });
  factory PhotoSize.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizeFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);

  @override
  String toString() => '''PhotoSize

fileId: $fileId
fileUniqueId: $fileUniqueId
width: $width
height: $height
fileSize: $fileSize
''';
}
