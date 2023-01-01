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
import './message.dart';

/// A recieved callback query
///
/// It is returned by the [TeleDart.onCallbackQuery] method.
///
/// This class combines [CallbackQuery] and [TeleDart]
/// to add the [answer] method, which lets you
/// easily reply to callback queries.
class TeleDartCallbackQuery extends CallbackQuery {
  final TeleDart _teledart;

  TeleDartCallbackQuery(this._teledart, CallbackQuery callbackQuery)
      : super(
          id: callbackQuery.id,
          from: callbackQuery.from,
          message: callbackQuery.message,
          inlineMessageId: callbackQuery.inlineMessageId,
          chatInstance: callbackQuery.chatInstance,
          data: callbackQuery.data,
          gameShortName: callbackQuery.gameShortName,
        );

  TeleDartMessage? get teledartMessage =>
      message == null ? null : TeleDartMessage(_teledart, message!);

  /// Answer the recieved callback query
  ///
  /// A wrapper around [TeleDart.answerCallbackQuery].
  /// On success, returns true.
  ///
  /// It can take some options that control the callback query answer.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answercallbackquery)
  /// for more information about those options.**
  Future<bool> answer({
    String? text,
    bool? show_alert,
    String? url,
    int? cache_time,
  }) =>
      _teledart.answerCallbackQuery(id,
          text: text, show_alert: show_alert, url: url, cache_time: cache_time);
}
