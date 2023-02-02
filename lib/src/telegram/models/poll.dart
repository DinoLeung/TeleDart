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

/// This object represents one size of a photo or a [file] / [sticker] thumbnail.
///
/// https://core.telegram.org/bots/api#poll
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
@JsonSerializable(fieldRename: FieldRename.snake)
class Poll {
  static const typeRegular = 'regular';
  static const typeQuiz = 'quiz';

  String id;
  String question;
  List<PollOption> options;
  int totalVoterCount;
  bool isClosed;
  bool isAnonymous;
  String type;
  bool allowsMultipleAnswers;
  int? correctOptionId;
  String? explanation;
  List<MessageEntity>? explanationEntities;
  int? openPeriod;
  int? closeDate;
  Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.totalVoterCount,
    required this.isClosed,
    required this.isAnonymous,
    required this.type,
    required this.allowsMultipleAnswers,
    this.correctOptionId,
    this.explanation,
    this.explanationEntities,
    this.openPeriod,
    this.closeDate,
  });
  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
  Map<String, dynamic> toJson() => _$PollToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get openPeriod_ =>
      openPeriod == null ? null : TimeHelper.toDuration(openPeriod!);
  set openPeriod_(Duration? duration) =>
      openPeriod = duration == null ? null : TimeHelper.toSeconds(duration);

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get closeDate_ =>
      closeDate == null ? null : TimeHelper.toDateTime(closeDate!);
  set closeDate_(DateTime? dateTime) =>
      closeDate = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);
}
