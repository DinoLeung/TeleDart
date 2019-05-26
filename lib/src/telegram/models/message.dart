/**
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

/// This object represents a message.
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable()
class Message {
  int message_id;
  User from;
  int date;
  Chat chat;
  User forward_from;
  Chat forward_from_chat;
  int forward_from_message_id;
  String forward_signature;
  String forward_sender_name;
  int forward_date;
  Message reply_to_message;
  int edit_date;
  String media_group_id;
  String author_signature;
  String text;
  List<MessageEntity> entities;
  List<MessageEntity> caption_entities;
  Audio audio;
  Document document;
  Animation animation;
  Game game;
  List<PhotoSize> photo;
  Sticker sticker;
  Video video;
  Voice voice;
  VideoNote video_note;
  String caption;
  Contact contact;
  Location location;
  Venue venue;
  Poll poll;
  List<User> new_chat_members;
  User left_chat_member;
  String new_chat_title;
  List<PhotoSize> new_chat_photo;
  bool delete_chat_photo;
  bool group_chat_created;
  bool supergroup_chat_created;
  bool channel_chat_created;
  int migrate_to_chat_id;
  int migrate_from_chat_id;
  Message pinned_message;
  Invoice invoice;
  SuccessfulPayment successful_payment;
  String connected_website;
  PassportData passport_data;

  Message(
      {this.message_id,
      this.from,
      this.date,
      this.chat,
      this.forward_from,
      this.forward_from_chat,
      this.forward_from_message_id,
      this.forward_signature,
      this.forward_sender_name,
      this.forward_date,
      this.reply_to_message,
      this.edit_date,
      this.media_group_id,
      this.author_signature,
      this.text,
      this.entities,
      this.caption_entities,
      this.audio,
      this.document,
      this.animation,
      this.game,
      this.photo,
      this.sticker,
      this.video,
      this.voice,
      this.video_note,
      this.caption,
      this.contact,
      this.location,
      this.venue,
      this.poll,
      this.new_chat_members,
      this.left_chat_member,
      this.new_chat_title,
      this.new_chat_photo,
      this.delete_chat_photo,
      this.group_chat_created,
      this.supergroup_chat_created,
      this.channel_chat_created,
      this.migrate_to_chat_id,
      this.migrate_from_chat_id,
      this.pinned_message,
      this.invoice,
      this.successful_payment,
      this.connected_website,
      this.passport_data});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  int indexOfEntity(String type) {
    List<MessageEntity> etts = entities ?? caption_entities;
    if (etts != null) {
      for (MessageEntity ett in etts) {
        if (ett.type == type) return etts.indexOf(ett);
      }
    }
    return -1;
  }

  MessageEntity entityOf(String type) {
    int i = indexOfEntity(type);
    if (i >= 0) {
      return (entities ?? caption_entities)[i];
    } else {
      return null;
    }
  }

  String getEntity(String type) {
    MessageEntity ett = entityOf(type);
    if (ett != null) {
      return (text ?? caption).substring(ett.offset, ett.offset + ett.length);
    } else {
      return null;
    }
  }
}
