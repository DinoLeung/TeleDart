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

import 'package:dartson/dartson_static.dart';

@Entity()
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
}

@Entity()
class WebhookInfo {
  String url;
  bool has_custom_certificate;
  int pending_update_count;
  int last_error_date;
  String last_error_message;
  int max_connections;
  List<String> allowed_updates;
}

@Entity()
class User {
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;
}

@Entity()
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
}

@Entity()
class Message {
  int message_id;
  User from;
  int date;
  Chat chat;
  User forward_from;
  Chat forward_from_char;
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

@Entity()
class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;
}

@Entity()
class PhotoSize {
  String file_id;
  int width;
  int height;
  int file_size;
}

@Entity()
class Audio {
  String file_id;
  int duration;
  String performer;
  String title;
  String mime_type;
  int file_size;
}

@Entity()
class Document {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mimi_type;
  int file_size;
}

@Entity()
class Video {
  String file_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mime_type;
  int file_size;
}

@Entity()
class Voice {
  String file_id;
  int duration;
  String mime_type;
  int file_size;
}

@Entity()
class VideoNote {
  String file_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;
}

@Entity()
class Contact {
  String phone_number;
  String first_name;
  String last_name;
  int user_id;
}

@Entity()
class Location {
  double longitude;
  double latitude;
}

@Entity()
class Venue {
  Location location;
  String title;
  String address;
  String foursquare_id;
}

@Entity()
class UserProfilePhotos {
  int total_count;
  List<PhotoSize> photos;
}

@Entity()
class File {
  String file_id;
  int file_size;
  String file_path;
}

@Entity()
class ReplyMarkup {}

@Entity()
class ReplyKeyboardMarkup implements ReplyMarkup {
  List<KeyboardButton> keyboard;
  bool resize_keyboard;
  bool one_time_keyboard;
  bool selective;
}

@Entity()
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;
}

@Entity()
class ReplyKeyboardRemove implements ReplyMarkup {
  bool remove_keyboard;
  bool selective;
}

@Entity()
class InlineKeyboardMarkup implements ReplyMarkup {
  List<InlineKeyboardButton> inline_keyboard;
}

@Entity()
class InlineKeyboardButton {
  String text;
  String url;
  String callback_data;
  String switch_inline_query;
  String switch_inline_query_current_chat;
  CallbackGame callback_game;
  bool pay;
}

@Entity()
class CallbackQuery {
  String id;
  User from;
  Message message;
  String inline_message_is;
  String chat_instance;
  String data;
  String game_short_name;
}

@Entity()
class ForceReply implements ReplyMarkup {
  bool forceReply;
  bool selective;
}

@Entity()
class ChatPhoto {
  String small_file_id;
  String big_file_id;
}

@Entity()
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
  bool can_send_message;
  bool can_send_media_messages;
  bool can_send_other_messages;
  bool can_add_web_page_previews;
}

@Entity()
class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;
}

@Entity()
abstract class InputMedia {
  String type;
  String media;
  String caption;
  String parse_mode;
}

@Entity()
class InputMediaPhoto implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
}

@Entity()
class InputMediaVideo implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  int width;
  int height;
  int duration;
  bool supports_streaming;
}

@Entity()
class Sticker {
  String file_id;
  int width;
  int height;
  PhotoSize thumb;
  String emoji;
  String set_name;
  MaskPosition mask_position;
  int file_size;
}

@Entity()
class StickerSet {
  String name;
  String title;
  bool contains_masks;
  List<Sticker> stickers;
}

@Entity()
class MaskPosition {
  Sticker point;
  double x_shift;
  double y_shift;
  double scale;
}

@Entity()
class InlineQuery {
  String id;
  User from;
  Location location;
  String query;
  String offset;
}

@Entity()
abstract class InlineQueryResult {
  String type;
  String id;
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
}

@Entity()
class InlineQueryResultContact implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'contact';
  String phone_number;
  String first_name;
  String last_name;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;
}

@Entity()
class InlineQueryResultGame implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'game';
  String game_short_name;
  InlineKeyboardMarkup reply_markup;
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
class InlineQueryResultCachedSticker implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'sticker';
  String sticker_file_id;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
}

@Entity()
class InlineQueryResultCachedDocument implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'document';
  String document_file_id;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
}

@Entity()
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
}

@Entity()
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
}

@Entity()
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
}

@Entity()
class InputMessageContent {}

@Entity()
class InputTextMessageContent implements InputMessageContent {
  String message_text;
  String parse_mode;
  bool disable_web_page_preview;
}

@Entity()
class InputLocationMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  int live_period;
}

@Entity()
class InputVenueMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;
}

@Entity()
class InputContactMessageContent implements InputMessageContent {
  String phone_number;
  String first_name;
  String last_name;
}

@Entity()
class ChosenInlineResult {
  String result_id;
  User from;
  Location location;
  String inline_message_id;
  String query;
}

@Entity()
class LabeledPrice {
  String label;
  int amount;
}

@Entity()
class Invoice {
  String title;
  String description;
  String start_parameter;
  String currency;
  int total_amount;
}

@Entity()
class ShippingAddress {
  String country_code;
  String state;
  String city;
  String street_line1;
  String street_line2;
  String post_code;
}

@Entity()
class OrderInfo {
  String name;
  String phone_number;
  String email;
  ShippingAddress shippingAddress;
}

@Entity()
class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;
}

@Entity()
class SuccessfulPayment {
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;
  String telegram_payment_charge_id;
  String provider_payment_charge_id;
}

@Entity()
class ShippingQuery {
  String id;
  User from;
  String invoice_payload;
  ShippingAddress shipping_address;
}

@Entity()
class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;
}

@Entity()
class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String text;
  List<MessageEntity> text_entities;
  Animation animation;
}

@Entity()
class Animation {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;
}

@Entity()
class CallbackGame {}

@Entity()
class GameHighScore {
  int position;
  User user;
  int score;
}
