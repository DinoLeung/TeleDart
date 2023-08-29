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
  MultipartFile? mediaFile;
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
  });

  // Factory to create InputMediaDocument from file
  factory InputMediaDocument.fromFile(
          {required io.File media,
          String? thumbnail,
          String? caption,
          String? parseMode,
          List<MessageEntity>? captionEntities,
          bool? disableContentTypeDetection}) =>
      InputMediaDocument(
        media: 'attach://${media.path}',
        thumbnail: thumbnail,
        caption: caption,
        parseMode: parseMode,
        captionEntities: captionEntities,
        disableContentTypeDetection: disableContentTypeDetection,
      )..mediaFile = MultipartFile(
          media.path, media.openRead(), media.lengthSync(),
          filename: media.path.split('/').last);

  // Factory to create InputMediaDocument with thumbnail file
  factory InputMediaDocument.withThumbnailFile({
    required String media,
    required io.File thumbnail,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableContentTypeDetection,
  }) =>
      InputMediaDocument(
        type: InputMedia.typeDocument,
        media: media,
        thumbnail: 'attach://${thumbnail.path}',
        caption: caption,
        parseMode: parseMode,
        captionEntities: captionEntities,
        disableContentTypeDetection: disableContentTypeDetection,
      )..thumbnailFile = MultipartFile(
          thumbnail.path, thumbnail.openRead(), thumbnail.lengthSync(),
          filename: thumbnail.path.split('/').last);

  // Factory to create InputMediaDocument from file and with thumbnail file
  factory InputMediaDocument.fromFileWithThumbnailFile({
    required io.File media,
    required io.File thumbnail,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableContentTypeDetection,
  }) =>
      InputMediaDocument(
        media: 'attach://${media.path}',
        thumbnail: 'attach://${thumbnail.path}',
        caption: caption,
        parseMode: parseMode,
        captionEntities: captionEntities,
        disableContentTypeDetection: disableContentTypeDetection,
      )
        ..mediaFile = MultipartFile(
            media.path, media.openRead(), media.lengthSync(),
            filename: media.path.split('/').last)
        ..thumbnailFile = MultipartFile(
            thumbnail.path, thumbnail.openRead(), thumbnail.lengthSync(),
            filename: thumbnail.path.split('/').last);

  factory InputMediaDocument.fromJson(Map<String, dynamic> json) =>
      _$InputMediaDocumentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaDocumentToJson(this);
}
