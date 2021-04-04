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

/// Represents an issue in one of the data fields that was provided by the user.
/// The error is considered resolved when the field's value changes.
///
/// https://core.telegram.org/bots/api#passportelementerrordatafield
@JsonSerializable()
class PassportElementErrorDataField implements PassportElementError {
  @override
  String? source;
  @override
  String? type;
  @override
  String? message;
  String? field_name;
  String? data_hash;
  PassportElementErrorDataField({
    this.source,
    this.type,
    this.message,
    this.field_name,
    this.data_hash,
  });
  factory PassportElementErrorDataField.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorDataFieldFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorDataFieldToJson(this);
}
