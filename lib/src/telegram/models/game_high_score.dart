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

/// This object represents one row of the high scores table for a game.
///
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable()
class GameHighScore {
  int? position;
  User? user;
  int? score;
  GameHighScore({
    this.position,
    this.user,
    this.score,
  });
  factory GameHighScore.fromJson(Map<String, dynamic> json) =>
      _$GameHighScoreFromJson(json);
  Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}
