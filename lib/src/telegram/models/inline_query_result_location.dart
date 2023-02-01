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

/// Represents a location on a map.
/// By default, the location will be sent by the user.
/// Alternatively,
/// you can use *inputMessageContent* to send a message with the specified content instead of the location.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineQueryResultLocation implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  double latitude;
  double longitude;
  String title;
  double? horizontalAccuracy;
  int? livePeriod;
  int? heading;
  int? proximityAlertRadius;
  @override
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  String? thumbUrl;
  int? thumbWidth;
  int? thumbHeight;

  InlineQueryResultLocation({
    required this.id,
    this.type = InlineQueryResult.typeLocation,
    required this.latitude,
    required this.longitude,
    required this.title,
    this.horizontalAccuracy,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius,
    this.replyMarkup,
    this.inputMessageContent,
    this.thumbUrl,
    this.thumbWidth,
    this.thumbHeight,
  });

  @JsonKey(includeFromJson: true)
  Duration? get livePeriod_ =>
      livePeriod == null ? null : TimeHelper.toDuration(livePeriod!);
  set livePeriod_(Duration? duration) =>
      livePeriod = duration == null ? null : TimeHelper.toSeconds(duration);

  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultLocationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);
}
