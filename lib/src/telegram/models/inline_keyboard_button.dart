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

/// This object represents one button of an inline keyboard.
///
/// You **must** use exactly one of the optional fields.
///
/// https://core.telegram.org/bots/api#inlinekeyboardbutton
@JsonSerializable(fieldRename: FieldRename.snake)
class InlineKeyboardButton {
  String text;
  String? url;
  String? callbackData;
  WebAppInfo? webApp;
  LoginUrl? loginUrl;
  String? switchInlineQuery;
  String? switchInlineQueryCurrentChat;
  CallbackGame? callbackGame;
  bool? pay;
  InlineKeyboardButton({
    required this.text,
    this.url,
    this.callbackData,
    this.webApp,
    this.loginUrl,
    this.switchInlineQuery,
    this.switchInlineQueryCurrentChat,
    this.callbackGame,
    this.pay,
  });
  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardButtonFromJson(json);
  Map<String, dynamic> toJson() => _$InlineKeyboardButtonToJson(this);
}
