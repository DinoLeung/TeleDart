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

/// This object represents one size of a photo or a [file] / [sticker] thumbnail.
///
/// https://core.telegram.org/bots/api#poll
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
@JsonSerializable()
class Poll {
  String id;
  String question;
  List<PollOption> options;
  int total_voter_count;
  bool is_closed;
  bool is_anonymous;
  String type;
  bool allows_multiple_answers;
  int correct_option_id;
  String explanation;
  List<MessageEntity> explanation_entities;
  int open_period;
  int close_date;
  Poll({
    this.id,
    this.question,
    this.options,
    this.total_voter_count,
    this.is_closed,
    this.is_anonymous,
    this.type,
    this.allows_multiple_answers,
    this.correct_option_id,
    this.explanation,
    this.explanation_entities,
    this.open_period,
    this.close_date,
  });
  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
  Map<String, dynamic> toJson() => _$PollToJson(this);

  @JsonKey(ignore: true)
  Duration get open_period_ => TimeHelper.toDuration(open_period);
  set open_period_(Duration duration) =>
      open_period = TimeHelper.toSeconds(duration);

  @JsonKey(ignore: true)
  DateTime get close_date_ => TimeHelper.toDateTime(close_date);
  set close_date_(DateTime dateTime) =>
      close_date = TimeHelper.toUnixTime(dateTime);
}
