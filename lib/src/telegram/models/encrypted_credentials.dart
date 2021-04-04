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

/// Contains data required for decrypting and authenticating [EncryptedPassportElement].
/// See the [Telegram Passport Documentation] for a complete description of the data decryption and authentication processes.
///
/// https://core.telegram.org/bots/api#encryptedcredentials
///
/// [EncryptedPassportElement]: https://core.telegram.org/bots/api#encryptedpassportelement
/// [Telegram Passport Documentation]: https://core.telegram.org/passport#receiving-information
@JsonSerializable()
class EncryptedCredentials {
  String? data;
  String? hash;
  String? secret;
  EncryptedCredentials({
    this.data,
    this.hash,
    this.secret,
  });
  factory EncryptedCredentials.fromJson(Map<String, dynamic> json) =>
      _$EncryptedCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptedCredentialsToJson(this);
}
