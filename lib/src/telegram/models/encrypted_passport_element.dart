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

/// Contains information about documents or other Telegram Passport elements shared with the bot by the user.
///
/// https://core.telegram.org/bots/api#encryptedpassportelement
@JsonSerializable(fieldRename: FieldRename.snake)
class EncryptedPassportElement {
  static const typePersonalDetails = 'personalDetails';
  static const typePassport = 'passport';
  static const typeDriverLicense = 'driverLicense';
  static const typeIdentityCard = 'identityCard';
  static const typeInternalPassport = 'internalPassport';
  static const typeAddress = 'address';
  static const typeUtilityBill = 'utilityBill';
  static const typeBankStatement = 'bankStatement';
  static const typeRentalAgreement = 'rentalAgreement';
  static const typePassportRegistration = 'passportRegistration';
  static const typeTemporaryRegistration = 'temporaryRegistration';
  static const typePhoneNumber = 'phoneNumber';
  static const typeEmail = 'email';

  String type;
  String? data;
  String? phoneNumber;
  String? email;
  List<PassportFile>? files;
  PassportFile? frontSide;
  PassportFile? reverseSide;
  PassportFile? selfie;
  List<PassportFile>? translation;
  String hash;
  EncryptedPassportElement({
    required this.type,
    this.data,
    this.phoneNumber,
    this.email,
    this.files,
    this.frontSide,
    this.reverseSide,
    this.selfie,
    this.translation,
    required this.hash,
  });
  factory EncryptedPassportElement.fromJson(Map<String, dynamic> json) =>
      _$EncryptedPassportElementFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptedPassportElementToJson(this);
}
