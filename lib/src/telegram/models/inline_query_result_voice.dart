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

/// Represents a link to a voice recording in an .ogg container encoded with OPUS.
///
/// By default, this voice recording will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the the voice message.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
class InlineQueryResultVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voice_url;
  String title;
  String? caption;
  String? parse_mode;
  int? voice_duration;
  List<MessageEntity>? caption_entities;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;

  InlineQueryResultVoice({
    required this.id,
    this.type = InlineQueryResult.VOICE,
    required this.voice_url,
    required this.title,
    this.caption,
    this.parse_mode,
    this.voice_duration,
    this.caption_entities,
    this.reply_markup,
    this.input_message_content,
  });

  @JsonKey(ignore: true)
  Duration? get voice_duration_ =>
      voice_duration == null ? null : TimeHelper.toDuration(voice_duration!);
  set voice_duration_(Duration? duration) =>
      voice_duration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}
