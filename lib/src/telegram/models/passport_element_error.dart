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

/// This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user.
/// It should be one of:
/// * [PassportElementErrorDataField](https://core.telegram.org/bots/api#passportelementerrordatafield)
/// * [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
/// * [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
/// * [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
/// * [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
/// * [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
/// * [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
/// * [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
/// * [PassportElementErrorUnspecified](https://core.telegram.org/bots/api#passportelementerrorunspecified)
///
/// https://core.telegram.org/bots/api#passportelementerror
@JsonSerializable()
class PassportElementError {
  String? source;
  String? type;
  String? message;
  PassportElementError({
    this.source,
    this.type,
    this.message,
  });
  factory PassportElementError.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFromJson(json);
  Map<String, dynamic> toJson() => _$PassportElementErrorToJson(this);
}
