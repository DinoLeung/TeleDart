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
import 'dart:async';

import '../../../teledart.dart';
import '../../telegram/model.dart';

class TeleDartMessage extends Message {
  TeleDart _teledart;

  TeleDartMessage(TeleDart teledart, Message message) {
    _teledart = teledart;
    super.message_id = message.message_id;
    super.from = message.from;
    super.date = message.date;
    super.sender_chat = message.sender_chat;
    super.chat = message.chat;
    super.forward_from = message.forward_from;
    super.forward_from_chat = message.forward_from_chat;
    super.forward_from_message_id = message.forward_from_message_id;
    super.forward_signature = message.forward_signature;
    super.forward_sender_name = message.forward_sender_name;
    super.forward_date = message.forward_date;
    super.reply_to_message = message.reply_to_message;
    super.via_bot = message.via_bot;
    super.edit_date = message.edit_date;
    super.media_group_id = message.media_group_id;
    super.author_signature = message.author_signature;
    super.text = message.text;
    super.entities = message.entities;
    super.animation = message.animation;
    super.audio = message.audio;
    super.document = message.document;
    super.photo = message.photo;
    super.sticker = message.sticker;
    super.video = message.video;
    super.video_note = message.video_note;
    super.voice = message.voice;
    super.caption = message.caption;
    super.caption_entities = message.caption_entities;
    super.contact = message.contact;
    super.dice = message.dice;
    super.game = message.game;
    super.poll = message.poll;
    super.venue = message.venue;
    super.location = message.location;
    super.new_chat_members = message.new_chat_members;
    super.left_chat_member = message.left_chat_member;
    super.new_chat_title = message.new_chat_title;
    super.new_chat_photo = message.new_chat_photo;
    super.delete_chat_photo = message.delete_chat_photo;
    super.group_chat_created = message.group_chat_created;
    super.supergroup_chat_created = message.supergroup_chat_created;
    super.channel_chat_created = message.channel_chat_created;
    super.message_auto_delete_timer_changed =
        message.message_auto_delete_timer_changed;
    super.migrate_to_chat_id = message.migrate_to_chat_id;
    super.migrate_from_chat_id = message.migrate_from_chat_id;
    super.pinned_message = message.pinned_message;
    super.invoice = message.invoice;
    super.successful_payment = message.successful_payment;
    super.connected_website = message.connected_website;
    super.passport_data = message.passport_data;
    super.proximity_alert_triggered = message.proximity_alert_triggered;
    super.voice_chat_started = message.voice_chat_started;
    super.voice_chat_ended = message.voice_chat_ended;
    super.voice_chat_participants_invited =
        message.voice_chat_participants_invited;
    super.reply_markup = message.reply_markup;
  }

  /// Short-cut to reply with a text message
  Future<Message> reply(String text,
          {bool withQuote = false,
          String parse_mode,
          List<MessageEntity> entities,
          bool disable_web_page_preview,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyMessage(this, text,
          withQuote: withQuote,
          parse_mode: parse_mode,
          entities: entities,
          disable_web_page_preview: disable_web_page_preview,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a photo message
  Future<Message> replyPhoto(dynamic photo,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyPhoto(this, photo,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a audio message
  Future<Message> replyAudio(dynamic audio,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          int duration,
          String performer,
          String title,
          dynamic thumb,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyAudio(this, audio,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          duration: duration,
          performer: performer,
          title: title,
          thumb: thumb,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a document message
  Future<Message> replyDocument(dynamic document,
          {bool withQuote = false,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyDocument(this, document,
          withQuote: withQuote,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a video message
  Future<Message> replyVideo(dynamic video,
          {bool withQuote = false,
          int duration,
          int width,
          int height,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool supports_streaming,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVideo(this, video,
          withQuote: withQuote,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          supports_streaming: supports_streaming,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a animation message
  Future<Message> replyAnimation(dynamic animation,
          {bool withQuote = false,
          int duration,
          int width,
          int height,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyAnimation(this, animation,
          withQuote: withQuote,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a voice message
  Future<Message> replyVoice(dynamic voice,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVoice(this, voice,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a video note message
  Future<Message> replyVideoNote(dynamic video_note,
          {bool withQuote = false,
          int duration,
          int length,
          dynamic thumb,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVideoNote(this, video_note,
          withQuote: withQuote,
          duration: duration,
          length: length,
          thumb: thumb,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a media group message
  Future<List<Message>> replyMediaGroup(List<InputMedia> media,
          {bool withQuote = false,
          bool disable_notification,
          bool allow_sending_without_reply}) =>
      _teledart.replyMediaGroup(this, media,
          withQuote: withQuote,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply);

  /// Short-cut to reply with a location message
  Future<Message> replyLocation(double latitude, double longitude,
          {bool withQuote = false,
          double horizontal_accuracy,
          int live_period,
          int heading,
          int proximity_alert_radius,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyLocation(this, latitude, longitude,
          withQuote: withQuote,
          horizontal_accuracy: horizontal_accuracy,
          live_period: live_period,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a venue message
  Future<Message> replyVenue(
          double latitude, double longitude, String title, String address,
          {bool withQuote = false,
          String foursquare_id,
          String foursquare_type,
          String google_place_id,
          String google_place_type,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVenue(this, latitude, longitude, title, address,
          withQuote: withQuote,
          foursquare_id: foursquare_id,
          foursquare_type: foursquare_type,
          google_place_id: google_place_id,
          google_place_type: google_place_type,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a contact message
  Future<Message> replyContact(String phone_number, String first_name,
          {bool withQuote = false,
          String last_name,
          String vcard,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyContact(this, phone_number, first_name,
          withQuote: withQuote,
          last_name: last_name,
          vcard: vcard,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a poll message
  Future<Message> replyPoll(String question, List<String> options,
          {bool withQuote = false,
          bool is_anonymous,
          String type,
          bool allows_multiple_answers,
          int correct_option_id,
          String explanation,
          String explanation_parse_mode,
          List<MessageEntity> explanation_entities,
          int open_period,
          int close_date,
          bool is_closed,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyPoll(this, question, options,
          withQuote: withQuote,
          is_anonymous: is_anonymous,
          type: type,
          allows_multiple_answers: allows_multiple_answers,
          correct_option_id: correct_option_id,
          explanation: explanation,
          explanation_parse_mode: explanation_parse_mode,
          explanation_entities: explanation_entities,
          open_period: open_period,
          close_date: close_date,
          is_closed: is_closed,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a dice message
  Future<Message> replyDice(
          {bool withQuote = false,
          String emoji = Dice.DICE,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replyDice(this,
          withQuote: withQuote,
          emoji: emoji,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a sticker
  Future<Message> replySticker(dynamic sticker,
          {bool withQuote = false,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      _teledart.replySticker(this, sticker,
          disable_notification: disable_notification,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);
}
