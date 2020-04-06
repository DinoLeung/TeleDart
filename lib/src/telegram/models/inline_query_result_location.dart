/**
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
/// you can use *input_message_content* to send a message with the specified content instead of the location.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable()
class InlineQueryResultLocation implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  double latitude;
  double longitude;
  String title;
  int live_period;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

  InlineQueryResultLocation({
    this.id,
    this.type = 'location',
    this.latitude,
    this.longitude,
    this.title,
    this.live_period,
    this.reply_markup,
    this.input_message_content,
    this.thumb_url,
    this.thumb_width,
    this.thumb_height,
  });

  @JsonKey(ignore: true)
  Duration get live_period_ => TimeHelper.toDuration(live_period);
  set live_period_(Duration duration) =>
      live_period = TimeHelper.toSeconds(duration);

  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultLocationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);
}
