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

/// Represents a venue.
/// By default, the venue will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the venue.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable()
class InlineQueryResultVenue implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  double? latitude;
  double? longitude;
  String? title;
  String? address;
  String? foursquare_id;
  String? foursquare_type;
  String? google_place_id;
  String? google_place_type;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;
  String? thumb_url;
  int? thumb_width;
  int? thumb_height;
  InlineQueryResultVenue({
    this.id,
    this.type = 'venue',
    this.latitude,
    this.longitude,
    this.title,
    this.address,
    this.foursquare_id,
    this.foursquare_type,
    this.google_place_id,
    this.google_place_type,
    this.reply_markup,
    this.input_message_content,
    this.thumb_url,
    this.thumb_width,
    this.thumb_height,
  });
  factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVenueFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVenueToJson(this);
}
