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
/// you can use *inputMessageContent* to send a message with the specified content instead of the the voice message.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voiceUrl;
  String title;
  String? caption;
  String? parseMode;
  int? voiceDuration;
  List<MessageEntity>? captionEntities;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultVoice({
    required this.id,
    this.type = InlineQueryResult.typeVoice,
    required this.voiceUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.voiceDuration,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @JsonKey(includeFromJson: true)
  Duration? get voiceDuration_ =>
      voiceDuration == null ? null : TimeHelper.toDuration(voiceDuration!);
  set voiceDuration_(Duration? duration) =>
      voiceDuration = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}
