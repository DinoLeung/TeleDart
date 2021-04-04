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

/// Represents the [content] of a location message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
class InputLocationMessageContent implements InputMessageContent {
  double? latitude;
  double? longitude;
  double? horizontal_accuracy;
  int? live_period;
  int? heading;
  int? proximity_alert_radius;

  InputLocationMessageContent({
    this.latitude,
    this.longitude,
    this.horizontal_accuracy,
    this.live_period,
    this.heading,
    this.proximity_alert_radius,
  });

  @JsonKey(ignore: true)
  Duration get live_period_ => TimeHelper.toDuration(live_period ?? 0);
  set live_period_(Duration duration) =>
      live_period = TimeHelper.toSeconds(duration);

  factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputLocationMessageContentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputLocationMessageContentToJson(this);
}
