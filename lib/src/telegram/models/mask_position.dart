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

/// This object describes the position on faces where a mask should be placed by default.
///
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable()
class MaskPosition {
  String? point;
  double? x_shift;
  double? y_shift;
  double? scale;
  MaskPosition({
    this.point,
    this.x_shift,
    this.y_shift,
    this.scale,
  });
  factory MaskPosition.fromJson(Map<String, dynamic> json) =>
      _$MaskPositionFromJson(json);
  Map<String, dynamic> toJson() => _$MaskPositionToJson(this);
}
