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

part of '../model.dart';

/// This object represents an animated emoji that displays a random value.
///
/// https://core.telegram.org/bots/api#dice
@JsonSerializable()
class Dice {
  static const String DICE = '🎲';
  static const String DART = '🎯';
  static const String BASKETBALL = '🏀';
  static const String FOOTBALL = '⚽';
  static const String BOWLING = '🎳';
  static const String SLOT_MACHINE = '🎰';

  int? value;
  String? emoji;
  Dice({
    this.value,
    this.emoji,
  });
  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);
  Map<String, dynamic> toJson() => _$DiceToJson(this);
}
