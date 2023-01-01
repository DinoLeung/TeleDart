/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2021  Dino PH Leung
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

/// Represents the [content] of an invoice message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputinvoicemessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable(fieldRename: FieldRename.snake)
class InputInvoiceMessageContent implements InputMessageContent {
  String title;
  String description;
  String payload;
  String providerToken;
  String currency;
  List<LabeledPrice> prices;
  int? maxTipAmount;
  List<int>? suggestedTipAmounts;
  String? providerData;
  String? photoUrl;
  int? photoSize;
  int? photoWidth;
  int? photoHeight;
  bool? needName;
  bool? needPhoneNumber;
  bool? needEmail;
  bool? needShippingAddress;
  bool? sendPhoneNumberToProvider;
  bool? sendEmailToProvider;
  bool? isFlexible;

  InputInvoiceMessageContent({
    required this.title,
    required this.description,
    required this.payload,
    required this.providerToken,
    required this.currency,
    required this.prices,
    this.maxTipAmount,
    this.suggestedTipAmounts,
    this.providerData,
    this.photoSize,
    this.photoWidth,
    this.photoHeight,
    this.needName,
    this.needPhoneNumber,
    this.needEmail,
    this.needShippingAddress,
    this.sendPhoneNumberToProvider,
    this.sendEmailToProvider,
    this.isFlexible,
  });

  factory InputInvoiceMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputInvoiceMessageContentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputInvoiceMessageContentToJson(this);
}
