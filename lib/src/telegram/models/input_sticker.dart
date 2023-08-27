/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2023  Dino PH Leung
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

/// This object describes a sticker to be added to a sticker set.
///
/// https://core.telegram.org/bots/api#inputsticker
@JsonSerializable(fieldRename: FieldRename.snake)
class InputSticker {
  String sticker;
  List<String> emojiList;
  MaskPosition? maskPosition;
  List<String>? keywords;

  @JsonKey(includeFromJson: false, includeToJson: false)
  MultipartFile? stickerFile;

  InputSticker({
    required this.sticker,
    required this.emojiList,
    this.maskPosition,
    this.keywords,
    this.stickerFile,
  });

  // Factory to create InputSticker from file
  factory InputSticker.file({
    required io.File sticker,
    required List<String> emojiList,
    MaskPosition? maskPosition,
    List<String>? keywords,
  }) =>
      InputSticker(
        sticker: 'attach://${sticker.path}',
        stickerFile: MultipartFile(
            sticker.path, sticker.openRead(), sticker.lengthSync(),
            filename: sticker.path.split('/').last),
        emojiList: emojiList,
        maskPosition: maskPosition,
        keywords: keywords,
      );

  factory InputSticker.fromJson(Map<String, dynamic> json) =>
      _$InputStickerFromJson(json);
  Map<String, dynamic> toJson() => _$InputStickerToJson(this);
}
