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

/// Represents a general file to be sent.
///
/// https://core.telegram.org/bots/api#inputmediadocument
@JsonSerializable(fieldRename: FieldRename.snake)
class InputMediaDocument implements InputMediaWithThumbnail {
  @override
  String type;
  @override
  String media;
  @override
  String? caption;
  @override
  String? parseMode;
  @override
  List<MessageEntity>? captionEntities;
  @override
  String? thumbnail;
  bool? disableContentTypeDetection;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  MultipartFile? thumbnailFile;

  InputMediaDocument({
    this.type = InputMedia.typeDocument,
    required this.media,
    this.thumbnail,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.disableContentTypeDetection,
    this.thumbnailFile,
  });

  // Factory to create InputMediaDocument with thumbnail file
  factory InputMediaDocument.withThumbnailFile({
    required io.File thumbnail,
    required String media,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableContentTypeDetection,
  }) =>
      InputMediaDocument(
        type: InputMedia.typeDocument,
        media: media,
        thumbnail: 'attach://${thumbnail.path}',
        thumbnailFile: MultipartFile(
            thumbnail.path, thumbnail.openRead(), thumbnail.lengthSync(),
            filename: thumbnail.path.split('/').last),
        caption: caption,
        parseMode: parseMode,
        captionEntities: captionEntities,
        disableContentTypeDetection: disableContentTypeDetection,
      );

  factory InputMediaDocument.fromJson(Map<String, dynamic> json) =>
      _$InputMediaDocumentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaDocumentToJson(this);
}
