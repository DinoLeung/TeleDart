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

/// This object contains information about an incoming pre-checkout query.
///
/// https://core.telegram.org/bots/api#precheckoutquery
@JsonSerializable(fieldRename: FieldRename.snake)
class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int totalAmount;
  String invoicePayload;
  String? shippingOptionId;
  OrderInfo? orderInfo;
  PreCheckoutQuery({
    required this.id,
    required this.from,
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo,
  });
  factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) =>
      _$PreCheckoutQueryFromJson(json);
  Map<String, dynamic> toJson() => _$PreCheckoutQueryToJson(this);
}
