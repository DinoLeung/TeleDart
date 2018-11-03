/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2018  Dino PH Leung
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

///https://core.telegram.org/bots/api#available-types

// import 'package:dartson/dartson_static.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(nullable: true)
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
  Update(
      {this.update_id,
      this.message,
      this.edited_message,
      this.channel_post,
      this.edited_channel_post,
      this.inline_query,
      this.chosen_inline_result,
      this.callback_query,
      this.shipping_query,
      this.pre_checkout_query});
  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@JsonSerializable(nullable: true)
class WebhookInfo {
  String url;
  bool has_custom_certificate;
  int pending_update_count;
  int last_error_date;
  String last_error_message;
  int max_connections;
  List<String> allowed_updates;
  WebhookInfo(
      {this.url,
      this.has_custom_certificate,
      this.pending_update_count,
      this.last_error_date,
      this.last_error_message,
      this.max_connections,
      this.allowed_updates});
  factory WebhookInfo.fromJson(Map<String, dynamic> json) =>
      _$WebhookInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);
}

@JsonSerializable(nullable: true)
class User {
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;
  User(
      {this.id,
      this.is_bot,
      this.first_name,
      this.last_name,
      this.username,
      this.language_code});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(nullable: true)
class Chat {
  int id;
  String type;
  String title;
  String username;
  String first_name;
  String last_name;
  bool all_members_are_administrators;
  ChatPhoto photo;
  String description;
  String invite_link;
  Message pinned_message;
  String sticker_set_name;
  bool can_set_sticker_set;
  Chat(
      {this.id,
      this.type,
      this.title,
      this.username,
      this.first_name,
      this.last_name,
      this.all_members_are_administrators,
      this.photo,
      this.description,
      this.invite_link,
      this.pinned_message,
      this.sticker_set_name,
      this.can_set_sticker_set});
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable(nullable: true)
class Message {
  int message_id;
  User from;
  int date;
  Chat chat;
  User forward_from;
  Chat forward_from_chat;
  int forward_from_message_id;
  String forward_signature;
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
  // PassportData passport_data;

  Message({
    this.message_id,
    this.from,
    this.date,
    this.chat,
    this.forward_from,
    this.forward_from_chat,
    this.forward_from_message_id,
    this.forward_signature,
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
    // this.passport_data
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  int indexOfEntity(String type) {
    List<MessageEntity> etts = entities ?? caption_entities;
    if (etts != null)
      for (MessageEntity ett in etts)
        if (ett.type == type) return etts.indexOf(ett);
    return -1;
  }

  MessageEntity entityOf(String type) {
    int i = indexOfEntity(type);
    if (i >= 0)
      return (entities ?? caption_entities)[i];
    else
      return null;
  }

  String getEntity(String type) {
    MessageEntity ett = entityOf(type);
    if (ett != null)
      return (text ?? caption).substring(ett.offset, ett.offset + ett.length);
    else
      return null;
  }
}

@JsonSerializable(nullable: true)
class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;
  MessageEntity({this.type, this.offset, this.length, this.url, this.user});
  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}

@JsonSerializable(nullable: true)
class PhotoSize {
  String file_id;
  int width;
  int height;
  int file_size;
  PhotoSize({this.file_id, this.width, this.height, this.file_size});
  factory PhotoSize.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizeFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);
}

@JsonSerializable(nullable: true)
class Audio {
  String file_id;
  int duration;
  String performer;
  String title;
  String mime_type;
  int file_size;
  PhotoSize thumb;
  Audio(
      {this.file_id,
      this.duration,
      this.performer,
      this.title,
      this.mime_type,
      this.file_size,
      this.thumb});
  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
  Map<String, dynamic> toJson() => _$AudioToJson(this);
}

@JsonSerializable(nullable: true)
class Document {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;
  Document(
      {this.file_id,
      this.thumb,
      this.file_name,
      this.mime_type,
      this.file_size});
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable(nullable: true)
class Video {
  String file_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mime_type;
  int file_size;
  Video(
      {this.file_id,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.mime_type,
      this.file_size});
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable(nullable: true)
class Animation {
  String file_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;
  Animation(
      {this.file_id,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.file_name,
      this.mime_type,
      this.file_size});
  factory Animation.fromJson(Map<String, dynamic> json) =>
      _$AnimationFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationToJson(this);
}

@JsonSerializable(nullable: true)
class Voice {
  String file_id;
  int duration;
  String mime_type;
  int file_size;
  Voice({this.file_id, this.duration, this.mime_type, this.file_size});
  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceToJson(this);
}

@JsonSerializable(nullable: true)
class VideoNote {
  String file_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;
  VideoNote(
      {this.file_id, this.length, this.duration, this.thumb, this.file_size});
  factory VideoNote.fromJson(Map<String, dynamic> json) =>
      _$VideoNoteFromJson(json);
  Map<String, dynamic> toJson() => _$VideoNoteToJson(this);
}

@JsonSerializable(nullable: true)
class Contact {
  String phone_number;
  String first_name;
  String last_name;
  int user_id;
  String vcard;
  Contact(
      {this.phone_number,
      this.first_name,
      this.last_name,
      this.user_id,
      this.vcard});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable(nullable: true)
class Location {
  double longitude;
  double latitude;
  Location({this.longitude, this.latitude});
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LocationToJson(this);
}

@JsonSerializable(nullable: true)
class Venue {
  Location location;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;
  Venue(
      {this.location,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type});
  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable(nullable: true)
class UserProfilePhotos {
  int total_count;
  List<PhotoSize> photos;
  UserProfilePhotos({this.total_count, this.photos});
  factory UserProfilePhotos.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePhotosFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfilePhotosToJson(this);
}

@JsonSerializable(nullable: true)
class File {
  String file_id;
  int file_size;
  String file_path;
  File({this.file_id, this.file_size, this.file_path});
  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
  Map<String, dynamic> toJson() => _$FileToJson(this);
}

@JsonSerializable(nullable: true)
// abstract class ReplyMarkup {}
class ReplyMarkup {
  ReplyMarkup();
  factory ReplyMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}

@JsonSerializable(nullable: true)
class ReplyKeyboardMarkup implements ReplyMarkup {
  List<KeyboardButton> keyboard;
  bool resize_keyboard;
  bool one_time_keyboard;
  bool selective;
  ReplyKeyboardMarkup(
      {this.keyboard,
      this.resize_keyboard,
      this.one_time_keyboard,
      this.selective});
  factory ReplyKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyKeyboardMarkupToJson(this);
}

@JsonSerializable(nullable: true)
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;
  KeyboardButton({this.text, this.request_contact, this.request_location});
  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);
  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}

@JsonSerializable(nullable: true)
class ReplyKeyboardRemove implements ReplyMarkup {
  bool remove_keyboard;
  bool selective;
  ReplyKeyboardRemove({this.remove_keyboard, this.selective});
  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardRemoveFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}

@JsonSerializable(nullable: true)
class InlineKeyboardMarkup implements ReplyMarkup {
  List<List<InlineKeyboardButton>> inline_keyboard;
  InlineKeyboardMarkup({this.inline_keyboard});
  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$InlineKeyboardMarkupToJson(this);
}

@JsonSerializable(nullable: true)
class InlineKeyboardButton {
  String text;
  String url;
  String callback_data;
  String switch_inline_query;
  String switch_inline_query_current_chat;
  CallbackGame callback_game;
  bool pay;
  InlineKeyboardButton(
      {this.text,
      this.url,
      this.callback_data,
      this.switch_inline_query,
      this.switch_inline_query_current_chat,
      this.callback_game,
      this.pay});
  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardButtonFromJson(json);
  Map<String, dynamic> toJson() => _$InlineKeyboardButtonToJson(this);
}

@JsonSerializable(nullable: true)
class CallbackQuery {
  String id;
  User from;
  Message message;
  String inline_message_id;
  String chat_instance;
  String data;
  String game_short_name;
  CallbackQuery(
      {this.id,
      this.from,
      this.message,
      this.inline_message_id,
      this.chat_instance,
      this.data,
      this.game_short_name});
  factory CallbackQuery.fromJson(Map<String, dynamic> json) =>
      _$CallbackQueryFromJson(json);
  Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}

@JsonSerializable(nullable: true)
class ForceReply implements ReplyMarkup {
  bool force_reply;
  bool selective;
  ForceReply({this.force_reply, this.selective});
  factory ForceReply.fromJson(Map<String, dynamic> json) =>
      _$ForceReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ForceReplyToJson(this);
}

@JsonSerializable(nullable: true)
class ChatPhoto {
  String small_file_id;
  String big_file_id;
  ChatPhoto({this.small_file_id, this.big_file_id});
  factory ChatPhoto.fromJson(Map<String, dynamic> json) =>
      _$ChatPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}

@JsonSerializable(nullable: true)
class ChatMember {
  User user;
  String status;
  int until_date;
  bool can_be_edited;
  bool can_change_info;
  bool can_post_messages;
  bool can_edit_messages;
  bool can_delete_messages;
  bool can_invite_users;
  bool can_restrict_members;
  bool can_pin_messages;
  bool can_promote_members;
  bool can_send_messages;
  bool can_send_media_messages;
  bool can_send_other_messages;
  bool can_add_web_page_previews;
  ChatMember(
      {this.user,
      this.status,
      this.until_date,
      this.can_be_edited,
      this.can_change_info,
      this.can_post_messages,
      this.can_edit_messages,
      this.can_delete_messages,
      this.can_invite_users,
      this.can_restrict_members,
      this.can_pin_messages,
      this.can_promote_members,
      this.can_send_messages,
      this.can_send_media_messages,
      this.can_send_other_messages,
      this.can_add_web_page_previews});
  factory ChatMember.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMemberToJson(this);
}

@JsonSerializable(nullable: true)
class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;
  ResponseParameters({this.migrate_to_chat_id, this.retry_after});
  factory ResponseParameters.fromJson(Map<String, dynamic> json) =>
      _$ResponseParametersFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseParametersToJson(this);
}

@JsonSerializable(nullable: true)
// abstract class InputMedia {
class InputMedia {
  String type;
  String media;
  String caption;
  String parse_mode;
  InputMedia({this.type, this.media, this.caption, this.parse_mode});
  factory InputMedia.fromJson(Map<String, dynamic> json) =>
      _$InputMediaFromJson(json);
  Map<String, dynamic> toJson() => _$InputMediaToJson(this);
}

@JsonSerializable(nullable: true)
class InputMediaPhoto implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type = 'photo';
  InputMediaPhoto({this.type, this.media, this.caption, this.parse_mode});
  factory InputMediaPhoto.fromJson(Map<String, dynamic> json) =>
      _$InputMediaPhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaPhotoToJson(this);
}

@JsonSerializable(nullable: true)
class InputMediaVideo implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type = 'video';
  dynamic thumb; // InputFile or String
  int width;
  int height;
  int duration;
  bool supports_streaming;
  InputMediaVideo(
      {this.type,
      this.media,
      this.caption,
      this.parse_mode,
      this.thumb,
      this.width,
      this.height,
      this.duration,
      this.supports_streaming});
  factory InputMediaVideo.fromJson(Map<String, dynamic> json) =>
      _$InputMediaVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);
}

@JsonSerializable(nullable: true)
class InputMediaAnimation implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type = 'animation';
  dynamic thumb; // InputFile or String
  int width;
  int height;
  int duration;
  InputMediaAnimation(
      {this.type,
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode,
      this.width,
      this.height,
      this.duration});
  factory InputMediaAnimation.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAnimationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaAnimationToJson(this);
}

@JsonSerializable(nullable: true)
class InputMediaAudio implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type = 'audio';
  dynamic thumb; // InputFile or String
  int duration;
  String performer;
  String title;
  InputMediaAudio(
      {this.type,
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode,
      this.duration,
      this.performer,
      this.title});
  factory InputMediaAudio.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAudioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaAudioToJson(this);
}

@JsonSerializable(nullable: true)
class InputMediaDocument implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type = 'document';
  dynamic thumb;
  InputMediaDocument(
      {this.type, this.media, this.thumb, this.caption, this.parse_mode});
  factory InputMediaDocument.fromJson(Map<String, dynamic> json) =>
      _$InputMediaDocumentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InputMediaDocumentToJson(this);
}

@JsonSerializable(nullable: true)
class Sticker {
  String file_id;
  int width;
  int height;
  PhotoSize thumb;
  String emoji;
  String set_name;
  MaskPosition mask_position;
  int file_size;
  Sticker(
      {this.file_id,
      this.width,
      this.height,
      this.thumb,
      this.emoji,
      this.set_name,
      this.mask_position,
      this.file_size});
  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}

@JsonSerializable(nullable: true)
class StickerSet {
  String name;
  String title;
  bool contains_masks;
  List<Sticker> stickers;
  StickerSet({this.name, this.title, this.contains_masks, this.stickers});
  factory StickerSet.fromJson(Map<String, dynamic> json) =>
      _$StickerSetFromJson(json);
  Map<String, dynamic> toJson() => _$StickerSetToJson(this);
}

@JsonSerializable(nullable: true)
class MaskPosition {
  String point;
  double x_shift;
  double y_shift;
  double scale;
  MaskPosition({this.point, this.x_shift, this.y_shift, this.scale});
  factory MaskPosition.fromJson(Map<String, dynamic> json) =>
      _$MaskPositionFromJson(json);
  Map<String, dynamic> toJson() => _$MaskPositionToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQuery {
  String id;
  User from;
  Location location;
  String query;
  String offset;
  InlineQuery({this.id, this.from, this.location, this.query, this.offset});
  factory InlineQuery.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryToJson(this);
}

@JsonSerializable(nullable: true)
// abstract class InlineQueryResult {
class InlineQueryResult {
  String type;
  String id;
  InlineQueryResult({this.type, this.id});
  factory InlineQueryResult.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryResultToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultArticle implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'article';
  String title;
  InputMessageContent input_message_content;
  InlineKeyboardMarkup reply_markup;
  String url;
  bool hide_url;
  String description;
  String thumb_url;
  String thumb_width;
  String thumb_height;
  InlineQueryResultArticle(
      {this.id,
      this.type,
      this.title,
      this.input_message_content,
      this.reply_markup,
      this.url,
      this.hide_url,
      this.description,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});
  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultArticleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultPhoto implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'photo';
  String photo_url;
  String thumb_url;
  int photo_width;
  int photo_height;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultPhoto(
      {this.id,
      this.type,
      this.photo_url,
      this.thumb_url,
      this.photo_width,
      this.photo_height,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultPhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultPhotoToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultGif implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'gif';
  String gif_url;
  int gif_width;
  int gif_height;
  int gif_duration;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultGif(
      {this.id,
      this.type,
      this.gif_url,
      this.gif_width,
      this.gif_height,
      this.gif_duration,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGifToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'mpeg4_gif';
  String mpeg4_url;
  int mpeg4_width;
  int mpeg4_height;
  int mpeg4_duration;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultMpeg4Gif(
      {this.id,
      this.type,
      this.mpeg4_url,
      this.mpeg4_width,
      this.mpeg4_height,
      this.mpeg4_duration,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultMpeg4GifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultVideo implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'video';
  String video_url;
  String mime_type;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  int video_width;
  int video_height;
  int video_duration;
  String description;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultVideo(
      {this.id,
      this.type,
      this.video_url,
      this.mime_type,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.video_width,
      this.video_height,
      this.video_duration,
      this.description,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultAudio implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'audio';
  String audio_url;
  String title;
  String caption;
  String parse_mode;
  String performer;
  int audio_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultAudio(
      {this.id,
      this.type,
      this.audio_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.performer,
      this.audio_duration,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultAudioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultAudioToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'voice';
  String voice_url;
  String title;
  String caption;
  String parse_mode;
  int voice_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultVoice(
      {this.id,
      this.type,
      this.voice_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.voice_duration,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultDocument implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'document';
  String title;
  String caption;
  String parse_mode;
  String document_url;
  String mime_type;
  String description;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
  InlineQueryResultDocument(
      {this.id,
      this.type,
      this.title,
      this.caption,
      this.parse_mode,
      this.document_url,
      this.mime_type,
      this.description,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});
  factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultDocumentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultDocumentToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultLocation implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'location';
  double latitude;
  double longitude;
  String title;
  int live_period;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
  InlineQueryResultLocation(
      {this.id,
      this.type,
      this.latitude,
      this.longitude,
      this.title,
      this.live_period,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});
  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultLocationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultVenue implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'venue';
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
  InlineQueryResultVenue(
      {this.id,
      this.type,
      this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});
  factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVenueFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVenueToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultContact implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'contact';
  String phone_number;
  String first_name;
  String last_name;
  String vcard;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
  InlineQueryResultContact(
      {this.id,
      this.type,
      this.phone_number,
      this.first_name,
      this.last_name,
      this.vcard,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});
  factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultContactFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultContactToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultGame implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'game';
  String game_short_name;
  InlineKeyboardMarkup reply_markup;
  InlineQueryResultGame(
      {this.id, this.type, this.game_short_name, this.reply_markup});
  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedPhoto implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'photo';
  String photo_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedPhoto(
      {this.id,
      this.type,
      this.photo_file_id,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedPhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedPhotoToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedGif implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'gif';
  String gif_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedGif(
      {this.id,
      this.type,
      this.gif_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedGifFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedGifToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'mpeg4_gif';
  String mpeg4_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedMpeg4Gif(
      {this.id,
      this.type,
      this.mpeg4_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedMpeg4GifFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$InlineQueryResultCachedMpeg4GifToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedSticker implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'sticker';
  String sticker_file_id;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedSticker(
      {this.id,
      this.type,
      this.sticker_file_id,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedStickerFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedStickerToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedDocument implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'document';
  String title;
  String document_file_id;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedDocument(
      {this.id,
      this.type,
      this.title,
      this.document_file_id,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedDocument.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedDocumentFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$InlineQueryResultCachedDocumentToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedVideo implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'video';
  String video_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedVideo(
      {this.id,
      this.type,
      this.video_file_id,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVideoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVideoToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'voice';
  String voice_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedVoice(
      {this.id,
      this.type,
      this.voice_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVoiceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVoiceToJson(this);
}

@JsonSerializable(nullable: true)
class InlineQueryResultCachedAudio implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'audio';
  String audio_file_id;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  InlineQueryResultCachedAudio(
      {this.id,
      this.type,
      this.audio_file_id,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedAudioFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedAudioToJson(this);
}

@JsonSerializable(nullable: true)
// abstract class InputMessageContent {
class InputMessageContent {
  InputMessageContent();
  factory InputMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}

@JsonSerializable(nullable: true)
class InputTextMessageContent implements InputMessageContent {
  String message_text;
  String parse_mode;
  bool disable_web_page_preview;
  InputTextMessageContent(
      {this.message_text, this.parse_mode, this.disable_web_page_preview});
  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputTextMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputTextMessageContentToJson(this);
}

@JsonSerializable(nullable: true)
class InputLocationMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  int live_period;
  InputLocationMessageContent(
      {this.latitude, this.longitude, this.live_period});
  factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputLocationMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputLocationMessageContentToJson(this);
}

@JsonSerializable(nullable: true)
class InputVenueMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;
  InputVenueMessageContent(
      {this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type});
  factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputVenueMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputVenueMessageContentToJson(this);
}

@JsonSerializable(nullable: true)
class InputContactMessageContent implements InputMessageContent {
  String phone_number;
  String first_name;
  String last_name;
  String vcard;
  InputContactMessageContent(
      {this.phone_number, this.first_name, this.last_name, this.vcard});
  factory InputContactMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputContactMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputContactMessageContentToJson(this);
}

@JsonSerializable(nullable: true)
class ChosenInlineResult {
  String result_id;
  User from;
  Location location;
  String inline_message_id;
  String query;
  ChosenInlineResult(
      {this.result_id,
      this.from,
      this.location,
      this.inline_message_id,
      this.query});
  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) =>
      _$ChosenInlineResultFromJson(json);
  Map<String, dynamic> toJson() => _$ChosenInlineResultToJson(this);
}

@JsonSerializable(nullable: true)
class LabeledPrice {
  String label;
  int amount;
  LabeledPrice({this.label, this.amount});
  factory LabeledPrice.fromJson(Map<String, dynamic> json) =>
      _$LabeledPriceFromJson(json);
  Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}

@JsonSerializable(nullable: true)
class Invoice {
  String title;
  String description;
  String start_parameter;
  String currency;
  int total_amount;
  Invoice(
      {this.title,
      this.description,
      this.start_parameter,
      this.currency,
      this.total_amount});
  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable(nullable: true)
class ShippingAddress {
  String country_code;
  String state;
  String city;
  String street_line1;
  String street_line2;
  String post_code;
  ShippingAddress(
      {this.country_code,
      this.state,
      this.city,
      this.street_line1,
      this.street_line2,
      this.post_code});
  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable(nullable: true)
class OrderInfo {
  String name;
  String phone_number;
  String email;
  ShippingAddress shippingAddress;
  OrderInfo({this.name, this.phone_number, this.email, this.shippingAddress});
  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);
  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);
}

@JsonSerializable(nullable: true)
class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;
  ShippingOption({this.id, this.title, this.prices});
  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}

@JsonSerializable(nullable: true)
class SuccessfulPayment {
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;
  String telegram_payment_charge_id;
  String provider_payment_charge_id;
  SuccessfulPayment(
      {this.currency,
      this.total_amount,
      this.invoice_payload,
      this.shipping_option_id,
      this.order_info,
      this.telegram_payment_charge_id,
      this.provider_payment_charge_id});
  factory SuccessfulPayment.fromJson(Map<String, dynamic> json) =>
      _$SuccessfulPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessfulPaymentToJson(this);
}

@JsonSerializable(nullable: true)
class ShippingQuery {
  String id;
  User from;
  String invoice_payload;
  ShippingAddress shipping_address;
  ShippingQuery(
      {this.id, this.from, this.invoice_payload, this.shipping_address});
  factory ShippingQuery.fromJson(Map<String, dynamic> json) =>
      _$ShippingQueryFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingQueryToJson(this);
}

@JsonSerializable(nullable: true)
class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;
  PreCheckoutQuery(
      {this.id,
      this.from,
      this.currency,
      this.total_amount,
      this.invoice_payload,
      this.shipping_option_id,
      this.order_info});
  factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) =>
      _$PreCheckoutQueryFromJson(json);
  Map<String, dynamic> toJson() => _$PreCheckoutQueryToJson(this);
}

@JsonSerializable(nullable: true)
class PassportData {
  List<EncryptedPassportElement> data;
  EncryptedCredentials credentials;
  PassportData({this.data, this.credentials});
  factory PassportData.fromJson(Map<String, dynamic> json) =>
      _$PassportDataFromJson(json);
  Map<String, dynamic> toJson() => _$PassportDataToJson(this);
}

@JsonSerializable(nullable: true)
class PassportFile {
  String file_id;
  int file_size;
  int file_date;
  PassportFile({this.file_id, this.file_size, this.file_date});
  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);
  Map<String, dynamic> toJson() => _$PassportFileToJson(this);
}

@JsonSerializable(nullable: true)
class EncryptedPassportElement {
  String type;
  String data;
  String phone_number;
  String email;
  List<PassportFile> files;
  PassportFile front_side;
  PassportFile reverse_side;
  PassportFile selfie;
  List<PassportFile> translation;
  String hash;
  EncryptedPassportElement(
      {this.type,
      this.data,
      this.phone_number,
      this.email,
      this.files,
      this.front_side,
      this.reverse_side,
      this.selfie,
      this.translation,
      this.hash});
  factory EncryptedPassportElement.fromJson(Map<String, dynamic> json) =>
      _$EncryptedPassportElementFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptedPassportElementToJson(this);
}

@JsonSerializable(nullable: true)
class EncryptedCredentials {
  String data;
  String hash;
  String secret;
  EncryptedCredentials({this.data, this.hash, this.secret});
  factory EncryptedCredentials.fromJson(Map<String, dynamic> json) =>
      _$EncryptedCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptedCredentialsToJson(this);
}

@JsonSerializable(nullable: true)
// abstract class PassportElementError {}
class PassportElementError {
  String source;
  String type;
  String message;
  PassportElementError({this.source, this.type, this.message});
  factory PassportElementError.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFromJson(json);
  Map<String, dynamic> toJson() => _$PassportElementErrorToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorDataField implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String field_name;
  String data_hash;
  PassportElementErrorDataField(
      {this.source, this.type, this.message, this.field_name, this.data_hash});
  factory PassportElementErrorDataField.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorDataFieldFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorDataFieldToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorFrontSide implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorFrontSide(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorFrontSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFrontSideFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFrontSideToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorReverseSide implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorReverseSide(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorReverseSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorReverseSideFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorReverseSideToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorSelfie implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorSelfie(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorSelfie.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorSelfieFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorSelfieToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorFile implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorFile(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorFile.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFileFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFileToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorFiles implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  List<String> file_hashes;
  PassportElementErrorFiles(
      {this.source, this.type, this.message, this.file_hashes});
  factory PassportElementErrorFiles.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFilesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFilesToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorTranslationFile implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorTranslationFile(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorTranslationFile.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFileFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFileToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorTranslationFiles implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  List<String> file_hashes;
  PassportElementErrorTranslationFiles(
      {this.source, this.type, this.message, this.file_hashes});
  factory PassportElementErrorTranslationFiles.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFilesFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFilesToJson(this);
}

@JsonSerializable(nullable: true)
class PassportElementErrorUnspecified implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;
  PassportElementErrorUnspecified(
      {this.source, this.type, this.message, this.file_hash});
  factory PassportElementErrorUnspecified.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorUnspecifiedFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorUnspecifiedToJson(this);
}

@JsonSerializable(nullable: true)
class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String text;
  List<MessageEntity> text_entities;
  Animation animation;
  Game(
      {this.title,
      this.description,
      this.photo,
      this.text,
      this.text_entities,
      this.animation});
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}

@JsonSerializable(nullable: true)
class CallbackGame {
  CallbackGame();
  factory CallbackGame.fromJson(Map<String, dynamic> json) =>
      _$CallbackGameFromJson(json);
  Map<String, dynamic> toJson() => _$CallbackGameToJson(this);
}

@JsonSerializable(nullable: true)
class GameHighScore {
  int position;
  User user;
  int score;
  GameHighScore({this.position, this.user, this.score});
  factory GameHighScore.fromJson(Map<String, dynamic> json) =>
      _$GameHighScoreFromJson(json);
  Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}
