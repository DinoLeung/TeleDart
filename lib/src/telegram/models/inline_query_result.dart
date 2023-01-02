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

/// This object represents one result of an inline query.
///
/// Telegram clients currently support results of the following 20 types:
/// * [InlineQueryResultCachedAudio](https://core.telegram.org/bots/api#inlinequeryresultcachedaudio)
/// * [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
/// * [InlineQueryResultCachedGif](https://core.telegram.org/bots/api#inlinequeryresultcachedgif)
/// * [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
/// * [InlineQueryResultCachedPhoto](https://core.telegram.org/bots/api#inlinequeryresultcachedphoto)
/// * [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
/// * [InlineQueryResultCachedVideo](https://core.telegram.org/bots/api#inlinequeryresultcachedvideo)
/// * [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
/// * [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
/// * [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
/// * [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
/// * [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
/// * [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
/// * [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
/// * [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
/// * [InlineQueryResultMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif)
/// * [InlineQueryResultPhoto](https://core.telegram.org/bots/api#inlinequeryresultphoto)
/// * [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
/// * [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
/// * [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
///
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable(fieldRename: FieldRename.snake)
abstract class InlineQueryResult {
  static const typeArticle = 'article';
  static const typeAudio = 'audio';
  static const typeDocument = 'document';
  static const typeGif = 'gif';
  static const typeMpeg4Gif = 'mpeg4_gif';
  static const typePhoto = 'photo';
  static const typeSticker = 'sticker';
  static const typeVideo = 'video';
  static const typeVoice = 'voice';
  static const typeContact = 'contact';
  static const typeGame = 'game';
  static const typeLocation = 'location';
  static const typeVenue = 'venue';

  String type;
  String id;
  InlineKeyboardMarkup? replyMarkup;
  InlineQueryResult({
    required this.type,
    required this.id,
    this.replyMarkup,
  });

  factory InlineQueryResult.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultFromJson(json);

  Map<String, dynamic> toJson();
}
