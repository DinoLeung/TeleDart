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

/// Represents a photo to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaphoto
@JsonSerializable()
class InputMediaPhoto implements InputMedia {
  @override
  String? type;
  @override
  String? media;
  @override
  String? caption;
  @override
  String? parse_mode;
  @override
  List<MessageEntity>? caption_entities;
  InputMediaPhoto({
    this.type = 'photo',
    this.media,
    this.caption,
    this.parse_mode,
    this.caption_entities,
  });
  factory InputMediaPhoto.fromJson(Map<String, dynamic> json) =>
      _$InputMediaPhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaPhotoToJson(this);
}
