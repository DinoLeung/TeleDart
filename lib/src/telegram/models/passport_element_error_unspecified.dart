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

/// Represents an issue in an unspecified place.
/// The error is considered resolved when new data is added.
///
/// https://core.telegram.org/bots/api#passportelementerrorunspecified
@JsonSerializable()
class PassportElementErrorUnspecified implements PassportElementError {
  @override
  String? source;
  @override
  String? type;
  @override
  String? message;
  String? element_hash;
  PassportElementErrorUnspecified({
    this.source,
    this.type,
    this.message,
    this.element_hash,
  });
  factory PassportElementErrorUnspecified.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorUnspecifiedFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorUnspecifiedToJson(this);
}
