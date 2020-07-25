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
  Dice dice;
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
  InlineKeyboardMarkup reply_markup;

  @JsonKey(ignore: true)
  TeleDart _teledart;

  Message({
    this.message_id,
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
    this.via_bot,
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
    this.dice,
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
    this.passport_data,
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

  void setTeledart(TeleDart teledart) {
    _teledart = teledart;
  }

  /// Short-cut to reply with a text message
  Future<Message> replyMessage(String text,
          {bool withQuote = false,
          String parse_mode,
          bool disable_web_page_preview,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyMessage(this, text,
          withQuote: withQuote,
          parse_mode: parse_mode,
          disable_web_page_preview: disable_web_page_preview,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a photo message
  Future<Message> replyPhoto(dynamic photo,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyPhoto(this, photo,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a audio message
  Future<Message> replyAudio(dynamic audio,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          int duration,
          String performer,
          String title,
          dynamic thumb,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyAudio(this, audio,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          duration: duration,
          performer: performer,
          title: title,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a document message
  Future<Message> replyDocument(dynamic document,
          {bool withQuote = false,
          dynamic thumb,
          String caption,
          String parse_mode,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyDocument(this, document,
          withQuote: withQuote,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          disable_notification: disable_notification,
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
          bool supports_streaming,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVideo(this, video,
          withQuote: withQuote,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          supports_streaming: supports_streaming,
          disable_notification: disable_notification,
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
          bool disable_notification,
          int reply_to_message_id,
          ReplyMarkup reply_markup}) =>
      _teledart.replyAnimation(this, animation,
          withQuote: withQuote,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a voice message
  Future<Message> replyVoice(dynamic voice,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVoice(this, voice,
          withQuote: withQuote,
          caption: caption,
          parse_mode: parse_mode,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a video note message
  Future<Message> replyVideoNote(dynamic video_note,
          {bool withQuote = false,
          int duration,
          int length,
          dynamic thumb,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVideoNote(this, video_note,
          withQuote: withQuote,
          duration: duration,
          length: length,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a media group message
  Future<List<Message>> replyMediaGroup(List<InputMedia> media,
          {bool withQuote = false, bool disable_notification}) =>
      _teledart.replyMediaGroup(this, media,
          withQuote: withQuote, disable_notification: disable_notification);

  /// Short-cut to reply with a location message
  Future<Message> replyLocation(double latitude, double longitude,
          {bool withQuote = false,
          int live_period,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyLocation(this, latitude, longitude,
          withQuote: withQuote,
          live_period: live_period,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a venue message
  Future<Message> replyVenue(
          double latitude, double longitude, String title, String address,
          {bool withQuote = false,
          String foursquare_id,
          String foursquare_type,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyVenue(this, latitude, longitude, title, address,
          withQuote: withQuote,
          foursquare_id: foursquare_id,
          foursquare_type: foursquare_type,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a contact message
  Future<Message> replyContact(String phone_number, String first_name,
          {bool withQuote = false,
          String last_name,
          String vcard,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replyContact(this, phone_number, first_name,
          withQuote: withQuote,
          last_name: last_name,
          vcard: vcard,
          disable_notification: disable_notification,
          reply_markup: reply_markup);

  /// Short-cut to reply with a contact message
  Future<Message> replySticker(dynamic sticker,
          {bool withQuote = false,
          bool disable_notification,
          ReplyMarkup reply_markup}) =>
      _teledart.replySticker(this, sticker,
          withQuote: withQuote,
          disable_notification: disable_notification,
          reply_markup: reply_markup);
}
