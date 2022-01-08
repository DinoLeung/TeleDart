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

/// A recieved inline query
///
/// It is returned by the [TeleDart.onInlineQuery] method.
///
/// This class combines [model.InlineQuery] and [TeleDart]
/// to add the [answer] method, which lets you
/// easily reply to inline queries.
class TeleDartInlineQuery extends InlineQuery {
  final TeleDart _teledart;

  TeleDartInlineQuery(this._teledart, InlineQuery inlineQuery)
      : super(
          id: inlineQuery.id,
          from: inlineQuery.from,
          query: inlineQuery.query,
          offset: inlineQuery.offset,
          chat_type: inlineQuery.chat_type,
          location: inlineQuery.location,
        );

  /// Answer the recieved inline query
  ///
  /// A wrapper around [TeleDart.answerInlineQuery].
  /// On success, returns true.
  ///
  /// Apart from a [List<InlineQueryResult>] of results,
  /// it can also take some options that control the inline dialog
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answerinlinequery)
  /// for more information about those options.**
  Future<bool> answer(
    List<InlineQueryResult> results, {
    int? cache_time,
    bool? is_personal,
    String? next_offset,
    String? switch_pm_text,
    String? switch_pm_parameter,
  }) =>
      _teledart.answerInlineQuery(this, results,
          cache_time: cache_time,
          is_personal: is_personal,
          next_offset: next_offset,
          switch_pm_text: switch_pm_text,
          switch_pm_parameter: switch_pm_parameter);
}
