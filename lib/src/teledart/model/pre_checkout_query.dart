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

/// A recieved pre-checkout query
///
/// It is returned by the [TeleDart.onPreCheckoutQuery] method.
///
/// This class combines [PreCheckoutQuery] and [TeleDart]
/// to add the [answer] method, which lets you
/// easily reply to pre-checkout queries.
class TeleDartPreCheckoutQuery extends PreCheckoutQuery {
  final TeleDart _teledart;

  TeleDartPreCheckoutQuery(this._teledart, PreCheckoutQuery preCheckoutQuery)
      : super(
          id: preCheckoutQuery.id,
          from: preCheckoutQuery.from,
          currency: preCheckoutQuery.currency,
          total_amount: preCheckoutQuery.total_amount,
          invoice_payload: preCheckoutQuery.invoice_payload,
          shipping_option_id: preCheckoutQuery.shipping_option_id,
          order_info: preCheckoutQuery.order_info,
        );

  /// Answer the recieved pre-checkout query
  ///
  /// A wrapper around [TeleDart.answerPreCheckoutQuery].
  /// On success, returns true.
  ///
  /// It can take a [bool] that indicates
  /// if the pre-checkout is possible, and an [error_message] that
  /// is shown to user if [ok] is false (You don't have to specify it if [ok] is true).
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answerprecheckoutquery)
  /// for more information about those options.**
  Future<bool> answer(bool ok, {String? error_message}) =>
      _teledart.answerPreCheckoutQuery(this, ok, error_message: error_message);
}
