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

/// This object represents a file uploaded to Telegram Passport.
/// Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
///
/// https://core.telegram.org/bots/api#passportfile
@JsonSerializable()
class PassportFile {
  String file_id;
  String file_unique_id;
  int file_size;
  int file_date;

  PassportFile({
    this.file_id,
    this.file_unique_id,
    this.file_size,
    this.file_date,
  });

  @JsonKey(ignore: true)
  DateTime get file_date_ => toDateTime(file_date);
  set file_date_(DateTime dateTime) => file_date = toUnixTime(dateTime);

  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);
  Map<String, dynamic> toJson() => _$PassportFileToJson(this);
}
