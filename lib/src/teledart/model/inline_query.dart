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

class TeleDartInlineQuery extends InlineQuery {
  TeleDart? _teledart;

  TeleDartInlineQuery(TeleDart teledart, InlineQuery inlineQuery) {
    _teledart = teledart;
    super.id = inlineQuery.id;
    super.from = inlineQuery.from;
    super.location = inlineQuery.location;
    super.query = inlineQuery.query;
    super.offset = inlineQuery.offset;
  }

  /// Short-cut to answer inline query
  Future<bool> answer(List<InlineQueryResult> results,
          {int? cache_time,
          bool? is_personal,
          String? next_offset,
          String? switch_pm_text,
          String? switch_pm_parameter}) =>
      _teledart?.answerInlineQuery(this, results,
          cache_time: cache_time ?? 0,
          is_personal: is_personal ?? false,
          next_offset: next_offset ?? '',
          switch_pm_text: switch_pm_text ?? '',
          switch_pm_parameter: switch_pm_parameter ?? '') ??
      Future.value(false);
}
