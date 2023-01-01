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

/// Represents a link to an mp3 audio file.
///
/// By default, this audio file will be sent by the user.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the audio.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultAudio implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String audioUrl;
  String title;
  String? caption;
  String? parseMode;
  String? performer;
  int? audioDuration;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultAudio({
    required this.id,
    this.type = InlineQueryResult.typeAudio,
    required this.audioUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.performer,
    this.audioDuration,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @JsonKey(ignore: true)
  Duration? get audioDuration_ =>
      audioDuration == null ? null : TimeHelper.toDuration(audioDuration!);
  set audioDuration_(Duration? duration) =>
      audioDuration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultAudioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultAudioToJson(this);
}
