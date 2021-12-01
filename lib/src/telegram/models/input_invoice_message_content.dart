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
@JsonSerializable()
class InputInvoiceMessageContent implements InputMessageContent {
  String title;
  String description;
  String payload;
  String provider_token;
  String currency;
  List<LabeledPrice> prices;
  int? max_tip_amount;
  List<int>? suggested_tip_amounts;
  String? provider_data;
  String? photo_url;
  int? photo_size;
  int? photo_width;
  int? photo_height;
  bool? need_name;
  bool? need_phone_number;
  bool? need_email;
  bool? need_shipping_address;
  bool? send_phone_number_to_provider;
  bool? send_email_to_provider;
  bool? is_flexible;

  InputInvoiceMessageContent({
    required this.title,
    required this.description,
    required this.payload,
    required this.provider_token,
    required this.currency,
    required this.prices,
    this.max_tip_amount,
    this.suggested_tip_amounts,
    this.provider_data,
    this.photo_size,
    this.photo_width,
    this.photo_height,
    this.need_name,
    this.need_phone_number,
    this.need_email,
    this.need_shipping_address,
    this.send_phone_number_to_provider,
    this.send_email_to_provider,
    this.is_flexible,
  });

  factory InputInvoiceMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputInvoiceMessageContentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputInvoiceMessageContentToJson(this);
}
