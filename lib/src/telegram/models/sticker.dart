/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of '../model.dart';

/// This object represents a sticker.
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable()
class Sticker {
  String? file_id;
  String? file_unique_id;
  int? width;
  int? height;
  bool? is_animated;
  PhotoSize? thumb;
  String? emoji;
  String? set_name;
  MaskPosition? mask_position;
  int? file_size;
  Sticker({
    this.file_id,
    this.file_unique_id,
    this.width,
    this.height,
    this.is_animated,
    this.thumb,
    this.emoji,
    this.set_name,
    this.mask_position,
    this.file_size,
  });
  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
