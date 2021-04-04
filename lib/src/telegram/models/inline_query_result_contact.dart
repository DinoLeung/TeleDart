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

/// Represents a contact with a phone number.
/// By default, the contact will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the contact.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcontact
@JsonSerializable()
class InlineQueryResultContact implements InlineQueryResult {
  @override
  String? id;
  @override
  String? type;
  String? phone_number;
  String? first_name;
  String? last_name;
  String? vcard;
  @override
  InlineKeyboardMarkup? reply_markup;
  InputMessageContent? input_message_content;
  String? thumb_url;
  int? thumb_width;
  int? thumb_height;
  InlineQueryResultContact({
    this.id,
    this.type = 'contact',
    this.phone_number,
    this.first_name,
    this.last_name,
    this.vcard,
    this.reply_markup,
    this.input_message_content,
    this.thumb_url,
    this.thumb_width,
    this.thumb_height,
  });
  factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultContactFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultContactToJson(this);
}
