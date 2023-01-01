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

/// This object represents the content of a message to be sent as a result of an inline query.
///
/// Telegram clients currently support the following 5 types:
/// * [InputTextMessageContent](https://core.telegram.org/bots/api#inputtextmessagecontent)
/// * [InputLocationMessageContent](https://core.telegram.org/bots/api#inputlocationmessagecontent)
/// * [InputVenueMessageContent](https://core.telegram.org/bots/api#inputvenuemessagecontent)
/// * [InputContactMessageContent](https://core.telegram.org/bots/api#inputcontactmessagecontent)
/// * [InputInvoiceMessageContent](https://core.telegram.org/bots/api#inputinvoicemessagecontent)
///
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable(fieldRename: FieldRename.snake)
// abstract class InputMessageContent {
class InputMessageContent {
  InputMessageContent();
  factory InputMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}
