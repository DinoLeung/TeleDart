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

class TeleDartShippingQuery extends ShippingQuery {
  final TeleDart _teledart;

  TeleDartShippingQuery(this._teledart, ShippingQuery shippingQuery)
      : super(
          id: shippingQuery.id,
          from: shippingQuery.from,
          invoice_payload: shippingQuery.invoice_payload,
          shipping_address: shippingQuery.shipping_address,
        );

  Future<bool> answer(bool ok,
          {List<ShippingOption>? shipping_options, String? error_message}) =>
      _teledart.answerShippingQuery(this, ok,
          shipping_options: shipping_options, error_message: error_message);
}
