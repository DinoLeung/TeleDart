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

/// This object represents an incoming inline query.
/// When the user sends an empty query,
/// your bot could return some default or trending results.
///
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable()
class InlineQuery {
  String? id;
  User? from;
  Location? location;
  String? query;
  String? offset;
  InlineQuery({
    this.id,
    this.from,
    this.location,
    this.query,
    this.offset,
  });
  factory InlineQuery.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryToJson(this);
}
