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

/// This object represents an incoming update.
/// At most one of the optional parameters can be present in any given update.
///
/// https://core.telegram.org/bots/api#update
@JsonSerializable()
class Update {
  int update_id;
  Message message;
  Message edited_message;
  Message channel_post;
  Message edited_channel_post;
  InlineQuery inline_query;
  ChosenInlineResult chosen_inline_result;
  CallbackQuery callback_query;
  ShippingQuery shipping_query;
  PreCheckoutQuery pre_checkout_query;
  Poll poll;
  PollAnswer poll_answer;
  ChatMemberUpdated my_chat_member;
  ChatMemberUpdated chat_member;
  Update({
    this.update_id,
    this.message,
    this.edited_message,
    this.channel_post,
    this.edited_channel_post,
    this.inline_query,
    this.chosen_inline_result,
    this.callback_query,
    this.shipping_query,
    this.pre_checkout_query,
    this.poll,
    this.poll_answer,
    this.my_chat_member,
    this.chat_member,
  });
  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}
