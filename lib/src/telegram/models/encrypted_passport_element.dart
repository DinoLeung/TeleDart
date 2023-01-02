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
  static const typePersonalDetails = 'personal_details';
  static const typePassport = 'passport';
  static const typeDriverLicense = 'driver_license';
  static const typeIdentityCard = 'identity_card';
  static const typeInternalPassport = 'internal_passport';
  static const typeAddress = 'address';
  static const typeUtilityBill = 'utility_bill';
  static const typeBankStatement = 'bank_statement';
  static const typeRentalAgreement = 'rental_agreement';
  static const typePassportRegistration = 'passport_registration';
  static const typeTemporaryRegistration = 'temporary_registration';
  static const typePhoneNumber = 'phone_number';
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
