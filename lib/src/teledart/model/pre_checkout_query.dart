/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2020  Dino PH Leung
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
import 'dart:async';

import '../../../teledart.dart';
import '../../telegram/model.dart';

class TeleDartPreCheckoutQuery extends PreCheckoutQuery {
  TeleDart? _teledart;

  TeleDartPreCheckoutQuery(
      TeleDart teledart, PreCheckoutQuery preCheckoutQuery) {
    _teledart = teledart;
    super.id = preCheckoutQuery.id;
    super.from = preCheckoutQuery.from;
    super.currency = preCheckoutQuery.currency;
    super.total_amount = preCheckoutQuery.total_amount;
    super.invoice_payload = preCheckoutQuery.invoice_payload;
    super.shipping_option_id = preCheckoutQuery.shipping_option_id;
    super.order_info = preCheckoutQuery.order_info;
  }

  /// Short-cut to answer pre-checkout query
  Future<bool> answer(bool ok, {String? error_message}) =>
      _teledart?.answerPreCheckoutQuery(this, ok,
          error_message: error_message ?? '') ??
      Future.value(false);
}
