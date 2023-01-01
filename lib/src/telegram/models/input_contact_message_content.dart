/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2019  Dino PH Leung
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

/// Represents the [content] of a contact message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable(fieldRename: FieldRename.snake)
class InputContactMessageContent implements InputMessageContent {
  String phoneNumber;
  String firstName;
  String? lastName;
  String? vcard;
  InputContactMessageContent({
    required this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.vcard,
  });
  factory InputContactMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputContactMessageContentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputContactMessageContentToJson(this);
}
