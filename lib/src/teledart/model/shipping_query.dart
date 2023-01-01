/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2020  Dino PH Leung
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

import 'dart:async';

import '../../../teledart.dart';
import '../../telegram/model.dart';

/// A recieved shipping query
///
/// It is returned by the [TeleDart.onShippingQuery] method.
///
/// This class combines [ShippingQuery] and [TeleDart]
/// to add the [answer] method, which lets you
/// easily reply to shipping queries.
class TeleDartShippingQuery extends ShippingQuery {
  final TeleDart _teledart;

  TeleDartShippingQuery(this._teledart, ShippingQuery shippingQuery)
      : super(
          id: shippingQuery.id,
          from: shippingQuery.from,
          invoicePayload: shippingQuery.invoicePayload,
          shippingAddress: shippingQuery.shippingAddress,
        );

  /// Answer the recieved shipping query
  ///
  /// A wrapper around [TeleDart.answerShippingQuery].
  /// On success, returns true.
  ///
  /// Apart from a [bool] that indicates if the shipping
  /// is possible, it can also take some options that
  /// control the shipping.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answershippingquery)
  /// for more information about those options.**
  Future<bool> answer(bool ok,
          {List<ShippingOption>? shippingOptions, String? errorMessage}) =>
      _teledart.answerShippingQuery(id, ok,
          shippingOptions: shippingOptions, errorMessage: errorMessage);
}
