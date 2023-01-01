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

/// Represents a link to a photo.
///
/// By default, this photo will be sent by the user with optional caption.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the photo.
///
/// https://core.telegram.org/bots/api#inlinequeryresultphoto
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultPhoto implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String photoUrl;
  String thumbUrl;
  int? photoWidth;
  int? photoHeight;
  String? title;
  String? description;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  InlineQueryResultPhoto({
    required this.id,
    this.type = InlineQueryResult.typePhoto,
    required this.photoUrl,
    required this.thumbUrl,
    this.photoWidth,
    this.photoHeight,
    this.title,
    this.description,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });
  factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultPhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultPhotoToJson(this);
}
