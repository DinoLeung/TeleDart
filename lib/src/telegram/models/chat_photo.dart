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

/// This object represents a chat photo.
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable()
class ChatPhoto {
  String? small_file_id;
  String? small_file_unique_id;
  String? big_file_id;
  String? big_file_unique_id;
  ChatPhoto({
    this.small_file_id,
    this.small_file_unique_id,
    this.big_file_id,
    this.big_file_unique_id,
  });
  factory ChatPhoto.fromJson(Map<String, dynamic> json) =>
      _$ChatPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}
