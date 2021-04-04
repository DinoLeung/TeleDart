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

/// This object represents a dice with random value from 1 to 6. (Yes, we're aware of the “proper” singular of die. But it's awkward, and we decided to help it change. One dice at a time!)
///
/// https://core.telegram.org/bots/api#dice
@JsonSerializable()
class BotCommand {
  String? command;
  String? description;
  BotCommand({
    this.command,
    this.description,
  });
  factory BotCommand.fromJson(Map<String, dynamic> json) =>
      _$BotCommandFromJson(json);
  Map<String, dynamic> toJson() => _$BotCommandToJson(this);
}
