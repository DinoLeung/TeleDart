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

/// Represents a [Game].
///
/// **Note:** This will only work in Telegram versions released after October 1, 2016.
/// Older clients will not display any inline results if a game result is among them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgame
///
/// [Game]: https://core.telegram.org/bots/api#games
@JsonSerializable()
class InlineQueryResultGame implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? game_short_name;
  @override
  InlineKeyboardMarkup? reply_markup;
  InlineQueryResultGame({
    this.id,
    this.type = 'game',
    this.game_short_name,
    this.reply_markup,
  });
  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}
