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

/// Represents a link to an article or web page.
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultArticle implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String title;
  InputMessageContent inputMessageContent;
  @override
  InlineKeyboardMarkup? replyMarkup;
  String? url;
  bool? hideUrl;
  String? description;
  String? thumbnailUrl;
  String? thumbnailWidth;
  String? thumbnailHeight;
  InlineQueryResultArticle({
    required this.id,
    this.type = InlineQueryResult.typeArticle,
    required this.title,
    required this.inputMessageContent,
    this.replyMarkup,
    this.url,
    this.hideUrl,
    this.description,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });
  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultArticleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}
