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

/// Represents a link to an article or web page.
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable()
class InlineQueryResultArticle implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? title;
  InputMessageContent? input_message_content;
  @override
  InlineKeyboardMarkup? reply_markup;
  String? url;
  bool? hide_url;
  String? description;
  String? thumb_url;
  String? thumb_width;
  String? thumb_height;
  InlineQueryResultArticle({
    this.id,
    this.type = 'article',
    this.title,
    this.input_message_content,
    this.reply_markup,
    this.url,
    this.hide_url,
    this.description,
    this.thumb_url,
    this.thumb_width,
    this.thumb_height,
  });
  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultArticleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}
