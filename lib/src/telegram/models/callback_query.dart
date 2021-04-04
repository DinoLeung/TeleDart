/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
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

part of '../model.dart';

/// This object represents an incoming callback query from a callback button in an [inline keyboard].
/// If the button that originated the query was attached to a message sent by the bot,
/// the field *message* will be present.
/// If the button was attached to a message sent via the bot (in [inline mode]),
/// the field *inline_message_id* will be present.
/// Exactly one of the fields *data* or *game_short_name* will be present.
///
/// **NOTE:** After the user presses a callback button,
/// Telegram clients will display a progress bar until you call [answerCallbackQuery].
/// It is, therefore, necessary to react by calling [answerCallbackQuery] even if no notification
/// to the user is needed (e.g., without specifying any of the optional parameters).
///
/// https://core.telegram.org/bots/api#callbackquery
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [inline mode]: https://core.telegram.org/bots/api#inline-mode
/// [answerCallbackQuery]: https://core.telegram.org/bots/api#answercallbackquery
@JsonSerializable()
class CallbackQuery {
  String? id;
  User? from;
  Message? message;
  String? inline_message_id;
  String? chat_instance;
  String? data;
  String? game_short_name;
  CallbackQuery({
    this.id,
    this.from,
    this.message,
    this.inline_message_id,
    this.chat_instance,
    this.data,
    this.game_short_name,
  });
  factory CallbackQuery.fromJson(Map<String, dynamic> json) =>
      _$CallbackQueryFromJson(json);
  Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}
