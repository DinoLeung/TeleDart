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

/// This object represents a message.
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable()
class Message {
  int message_id;
  User from;
  Chat sender_chat;
  int date;
  Chat chat;
  User forward_from;
  Chat forward_from_chat;
  int forward_from_message_id;
  String forward_signature;
  String forward_sender_name;
  int forward_date;
  Message reply_to_message;
  User via_bot;
  int edit_date;
  String media_group_id;
  String author_signature;
  String text;
  List<MessageEntity> entities;
  Animation animation;
  Audio audio;
  Document document;
  List<PhotoSize> photo;
  Sticker sticker;
  Video video;
  VideoNote video_note;
  Voice voice;
  String caption;
  List<MessageEntity> caption_entities;
  Contact contact;
  Dice dice;
  Game game;
  Poll poll;
  Venue venue;
  Location location;
  List<User> new_chat_members;
  User left_chat_member;
  String new_chat_title;
  List<PhotoSize> new_chat_photo;
  bool delete_chat_photo;
  bool group_chat_created;
  bool supergroup_chat_created;
  bool channel_chat_created;
  MessageAutoDeleteTimerChanged message_auto_delete_timer_changed;
  int migrate_to_chat_id;
  int migrate_from_chat_id;
  Message pinned_message;
  Invoice invoice;
  SuccessfulPayment successful_payment;
  String connected_website;
  PassportData passport_data;
  ProximityAlertTriggered proximity_alert_triggered;
  VoiceChatStarted voice_chat_started;
  VoiceChatEnded voice_chat_ended;
  VoiceChatParticipantsInvited voice_chat_participants_invited;
  InlineKeyboardMarkup reply_markup;

  Message({
    this.message_id,
    this.from,
    this.sender_chat,
    this.date,
    this.chat,
    this.forward_from,
    this.forward_from_chat,
    this.forward_from_message_id,
    this.forward_signature,
    this.forward_sender_name,
    this.forward_date,
    this.reply_to_message,
    this.via_bot,
    this.edit_date,
    this.media_group_id,
    this.author_signature,
    this.text,
    this.entities,
    this.animation,
    this.audio,
    this.document,
    this.photo,
    this.sticker,
    this.video,
    this.video_note,
    this.voice,
    this.caption,
    this.caption_entities,
    this.contact,
    this.dice,
    this.game,
    this.poll,
    this.venue,
    this.location,
    this.new_chat_members,
    this.left_chat_member,
    this.new_chat_title,
    this.new_chat_photo,
    this.delete_chat_photo,
    this.group_chat_created,
    this.supergroup_chat_created,
    this.channel_chat_created,
    this.message_auto_delete_timer_changed,
    this.migrate_to_chat_id,
    this.migrate_from_chat_id,
    this.pinned_message,
    this.invoice,
    this.successful_payment,
    this.connected_website,
    this.passport_data,
    this.proximity_alert_triggered,
    this.voice_chat_started,
    this.voice_chat_ended,
    this.voice_chat_participants_invited,
    this.reply_markup,
  });

  @JsonKey(ignore: true)
  DateTime get date_ => TimeHelper.toDateTime(date);
  set date_(DateTime dateTime) => date = TimeHelper.toUnixTime(dateTime);

  @JsonKey(ignore: true)
  DateTime get forward_date_ => TimeHelper.toDateTime(forward_date);
  set forward_date_(DateTime dateTime) =>
      forward_date = TimeHelper.toUnixTime(dateTime);

  @JsonKey(ignore: true)
  DateTime get edit_date_ => TimeHelper.toDateTime(edit_date);
  set edit_date_(DateTime dateTime) =>
      edit_date = TimeHelper.toUnixTime(dateTime);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  int indexOfEntity(String type) {
    var etts = entities ?? caption_entities;
    if (etts != null) {
      for (var ett in etts) {
        if (ett.type == type) return etts.indexOf(ett);
      }
    }
    return -1;
  }

  MessageEntity entityOf(String type) {
    var i = indexOfEntity(type);
    if (i >= 0) {
      return (entities ?? caption_entities)[i];
    } else {
      return null;
    }
  }

  String getEntity(String type) {
    var ett = entityOf(type);
    if (ett != null) {
      return (text ?? caption).substring(ett.offset, ett.offset + ett.length);
    } else {
      return null;
    }
  }
}
