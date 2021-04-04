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

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable()
class Venue {
  Location? location;
  String? title;
  String? address;
  String? foursquare_id;
  String? foursquare_type;
  String? google_place_id;
  String? google_place_type;
  Venue({
    this.location,
    this.title,
    this.address,
    this.foursquare_id,
    this.foursquare_type,
    this.google_place_id,
    this.google_place_type,
  });
  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}
