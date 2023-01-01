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

/// This object represents a file ready to be downloaded.
///
/// The file can be downloaded via the link `https://api.telegram.org/file/bot<token>/<file_path>`.
/// It is guaranteed that the link will be valid for at least 1 hour.
/// When the link expires, a new one can be requested by calling [getFile].
///
/// *Maximum file size to download is 20 MB*
///
/// https://core.telegram.org/bots/api#file
///
/// [getFile]: https://core.telegram.org/bots/api#getfile
@JsonSerializable(fieldRename: FieldRename.snake)
class File {
  String fileId;
  String fileUniqueId;
  int? fileSize;
  String? filePath;
  File({
    required this.fileId,
    required this.fileUniqueId,
    this.fileSize,
    this.filePath,
  });

  String? getDownloadLink(String token) => (filePath?.isEmpty ?? true)
      ? null
      : 'https://api.telegram.org/file/bot$token/$filePath';

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
  Map<String, dynamic> toJson() => _$FileToJson(this);
}
