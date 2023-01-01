/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2022  Dino PH Leung
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

part of '../model.dart';

/// Describes an inline message sent by a [Web App] on behalf of a user.
///
/// https://core.telegram.org/bots/api#sentwebappmessage
///
/// [Web App]: https://core.telegram.org/bots/webapps

@JsonSerializable(fieldRename: FieldRename.snake)
class SentWebAppMessage {
  String? inlineMessageId;

  SentWebAppMessage({this.inlineMessageId});

  factory SentWebAppMessage.fromJson(Map<String, dynamic> json) =>
      _$SentWebAppMessageFromJson(json);
  Map<String, dynamic> toJson() => _$SentWebAppMessageToJson(this);
}
