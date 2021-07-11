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

class TeleDartCallbackQuery extends CallbackQuery {
  final TeleDart _teledart;

  TeleDartCallbackQuery(this._teledart, CallbackQuery callbackQuery)
      : super(
          id: callbackQuery.id,
          from: callbackQuery.from,
          message: callbackQuery.message,
          inline_message_id: callbackQuery.inline_message_id,
          chat_instance: callbackQuery.chat_instance,
          data: callbackQuery.data,
          game_short_name: callbackQuery.game_short_name,
        );

  /// Short-cut to answer callback query
  Future<bool> answer({
    String? text,
    bool? show_alert,
    String? url,
    int? cache_time,
  }) =>
      _teledart.answerCallbackQuery(this,
          text: text, show_alert: show_alert, url: url, cache_time: cache_time);
}
