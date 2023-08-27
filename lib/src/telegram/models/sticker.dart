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

/// This object represents a sticker.
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable(fieldRename: FieldRename.snake)
class Sticker {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  bool isAnimated;
  bool isVideo;
  PhotoSize? thumb;
  String? emoji;
  String? setName;
  File? premiumAnimation;
  MaskPosition? maskPosition;
  String? customEmojiId;
  bool? needsRepainting;
  int? fileSize;
  Sticker({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.isAnimated,
    required this.isVideo,
    this.thumb,
    this.emoji,
    this.setName,
    this.premiumAnimation,
    this.maskPosition,
    this.customEmojiId,
    this.needsRepainting,
    this.fileSize,
  });
  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
