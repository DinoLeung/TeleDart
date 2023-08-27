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
  dynamic sticker; // InputFile or String
  List<String> emojiList;
  MaskPosition? maskPosition;
  List<String>? keywords;

  InputSticker({
    required this.sticker,
    required this.emojiList,
    this.maskPosition,
    this.keywords,
  });

  factory InputSticker.fromJson(Map<String, dynamic> json) =>
      _$InputStickerFromJson(json);
  Map<String, dynamic> toJson() => _$InputStickerToJson(this);
}

// TODO: The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, upload a new one using multipart/form-data, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. Animated and video stickers can't be uploaded via HTTP URL.
// Need to update files uploading for InputMedia type
// filename cannot be empty when posting to Telegram server
// var files = List<MultipartFile>.filled(
//         1,
//         MultipartFile(
//             'png_sticker', pngSticker.openRead(), pngSticker.lengthSync(),
//             filename: '${pngSticker.lengthSync()}'));
