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

/// This object represents the content of a service message,
/// sent whenever a user in the chat triggers a proximity alert set by another user.
///
/// https://core.telegram.org/bots/api#proximityalerttriggered
@JsonSerializable()
class ProximityAlertTriggered {
  User? traveler;
  User? watcher;
  int? distance;
  ProximityAlertTriggered({
    this.traveler,
    this.watcher,
    this.distance,
  });
  factory ProximityAlertTriggered.fromJson(Map<String, dynamic> json) =>
      _$ProximityAlertTriggeredFromJson(json);
  Map<String, dynamic> toJson() => _$ProximityAlertTriggeredToJson(this);
}
