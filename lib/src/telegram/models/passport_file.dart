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

/// This object represents a file uploaded to Telegram Passport.
///
/// Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
///
/// https://core.telegram.org/bots/api#passportfile
@JsonSerializable(fieldRename: FieldRename.snake)
class PassportFile {
  String fileId;
  String fileUniqueId;
  int fileSize;
  int fileDate;

  PassportFile({
    required this.fileId,
    required this.fileUniqueId,
    required this.fileSize,
    required this.fileDate,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime get fileDate_ => TimeHelper.toDateTime(fileDate);
  set fileDate_(DateTime dateTime) =>
      fileDate = TimeHelper.toUnixTime(dateTime);

  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);
  Map<String, dynamic> toJson() => _$PassportFileToJson(this);
}
