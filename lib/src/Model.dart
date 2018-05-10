import 'package:dartson/dartson_static.dart';

@Entity()
class Update {
  int update_id;
  Message message;
  Message edited_messaged;
  Message channel_post;
  InlineQuery inline_query;
  ChosenInlineResult chosen_inline_result;
  CallbackQuery callback_query;
  PreCheckoutQuery pre_checkout_query;

//  Update(this.update_id,
//      {this.message, this.edited_messaged, this.channel_post,
//        this.inline_query, this.chosen_inline_result,
//        this.callback_query, this.pre_checkout_query});

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

//  WebhookInfo(this.url, this.has_custom_certificate, this.pending_update_count,
//      {this.last_error_date, this.last_error_message, this.max_connections,
//        this.allowed_updates});

}

@Entity()
class User {
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;

//  User(this.id, this.is_bot, this.first_name,
//      {this.last_name, this.username, this.language_code});

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

//  Chat(this.id, this.type,
//      {this.title, this.username, this.first_name, this.last_name,
//        this.all_members_are_administrators, this.photo,
//        this.description, this.invite_link, this.pinned_message,
//        this.sticker_set_name, this.can_set_sticker_set});

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

//  Message(this.message_id, this.from, this.date, this.chat,
//      {this.forward_from, this.forward_from_char, this.forward_from_message_id,
//        this.forward_signature, this.forward_date, this.reply_to_message,
//        this.edit_date, this.media_group_id, this.author_signature, this.text,
//        this.entities, this.caption_entities, this.audio, this.document,
//        this.game, this.photo, this.sticker, this.video, this.voice,
//        this.video_note, this.caption, this.contact, this.location, this.venue,
//        this.new_chat_members, this.left_chat_member, this.new_chat_title,
//        this.new_chat_photo, this.delete_chat_photo, this.group_chat_created,
//        this.supergroup_chat_created, this.channel_chat_created,
//        this.migrate_to_chat_id, this.migrate_from_chat_id, this.pinned_message,
//        this.invoice, this.successful_payment, this.connected_website});

}

@Entity()
class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;

//  MessageEntity(this.type, this.offset, this.length,
//      {this.url, this.user});

}

@Entity()
class PhotoSize {
  String file_id;
  int width;
  int height;
  int file_size;

//  PhotoSize(this.file_id, this.width, this.height,
//      {this.file_size});

}

@Entity()
class Audio {
  String file_id;
  int duration;
  String performer;
  String title;
  String mime_type;
  int file_size;

//  Audio(this.file_id, this.duration,
//      {this.performer, this.title, this.mime_type, this.file_size});

}

@Entity()
class Document {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mimi_type;
  int file_size;

//  Document(this.file_id,
//      {this.thumb, this.file_name, this.mimi_type, this.file_size});

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

//  Video(this.file_id, this.width, this.height, this.duration,
//      {this.thumb, this.mime_type, this.file_size});

}

@Entity()
class Voice {
  String file_id;
  int duration;
  String mime_type;
  int file_size;

//  Voice(this.file_id, this.duration,
//      {this.mime_type, this.file_size});

}

@Entity()
class VideoNote {
  String file_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;

//  VideoNote(this.file_id, this.length, this.duration,
//      {this.thumb, this.file_size});

}

@Entity()
class Contact {
  String phone_number;
  String first_name;
  String last_name;
  int user_id;

//  Contact(this.phone_number, this.first_name,
//      {this.last_name, this.user_id});

}

@Entity()
class Location {
  double longitude;
  double latitude;

//  Location(this.longitude, this.latitude);

}

@Entity()
class Venue {
  Location location;
  String title;
  String address;
  String foursquare_id;

//  Venue(this.location, this.title, this.address,
//      {this.foursquare_id});

}

@Entity()
class UserProfilePhotos {
  int total_count;
  List<PhotoSize> photos;

//  UserProfilePhotos(this.total_count, this.photos);

}

@Entity()
class File {
  String file_id;
  int file_size;
  String file_path;

//  File(this.file_id, this.file_size, this.file_path);

}

@Entity()
class ReplyMarkup {}

@Entity()
class ReplyKeyboardMarkup extends ReplyMarkup {
  List<KeyboardButton> keyboard;
  bool resize_keyboard;
  bool one_time_keyboard;
  bool selective;

//  ReplyKeyboardMarkup(this.keyboard,
//      {this.resize_keyboard, this.one_time_keyboard, this.selective});

}

@Entity()
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;

//  KeyboardButton(this.text,
//      {this.request_contact, this.request_location});

}

@Entity()
class ReplyKeyboardRemove extends ReplyMarkup {
  bool remove_keyboard;
  bool selective;

//  ReplyKeyboardRemove(this.remove_keyboard,
//      {this.selective});

}

@Entity()
class InlineKeyboardMarkup extends ReplyMarkup {
  List<InlineKeyboardButton> inline_keyboard;

//  InlineKeyboardMarkup(this.inline_keyboard);

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

//  InlineKeyboardButton(this.text,
//      {this.url, this.callback_data, this.switch_inline_query,
//        this.switch_inline_query_current_chat, this.callback_game, this.pay});

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

//  CallbackQuery(this.id, this.from,
//      {this.message, this.inline_message_is, this.chat_instance,
//        this.data, this.game_short_name});

}

@Entity()
class ForceReply extends ReplyMarkup {
  bool forceReply;
  bool selective;

//  ForceReply(this.forceReply,
//      {this.selective});

}

@Entity()
class ChatPhoto {
  String small_file_id;
  String big_file_id;

//  ChatPhoto(this.small_file_id, this.big_file_id);

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

//  ChatMember(this.user, this.status,
//      {this.until_date, this.can_be_edited, this.can_change_info,
//        this.can_post_messages, this.can_edit_messages,
//        this.can_delete_messages, this.can_invite_users,
//        this.can_restrict_members, this.can_pin_messages,
//        this.can_promote_members, this.can_send_message,
//        this.can_send_media_messages, this.can_send_other_messages,
//        this.can_add_web_page_previews});

}

@Entity()
class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;

//  ResponseParameters(
//      {this.migrate_to_chat_id, this.retry_after});

}

@Entity()
abstract class InputMedia {
  String type;
  String media;
  String caption;
  String parse_mode;

//  InputMedia(this.type, this.media, this.caption, this.parse_mode);

}

@Entity()
class InputMediaPhoto extends InputMedia {
//  InputMediaPhoto(String type, String media, String caption, String parse_mode)
//      : super(type, media, caption, parse_mode);
}

@Entity()
class InputMediaVideo extends InputMedia {
  int width;
  int height;
  int duration;
  bool supports_streaming;

//  InputMediaVideo(String type, String media, String caption, String parse_mode,
//      {this.width, this.height, this.duration, this.supports_streaming})
//      : super(type, media, caption, parse_mode);

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

//  Sticker(this.file_id, this.width, this.height,
//      {this.thumb, this.emoji, this.set_name,
//        this.mask_position, this.file_size});

}

@Entity()
class StickerSet {
  String name;
  String title;
  bool contains_masks;
  List<Sticker> stickers;

//  StickerSet(this.name, this.title, this.contains_masks, this.stickers);

}

@Entity()
class MaskPosition {
  Sticker point;
  double x_shift;
  double y_shift;
  double scale;

//  MaskPosition(this.point, this.x_shift, this.y_shift, this.scale);

}

@Entity()
class InlineQuery {
  String id;
  User from;
  Location location;
  String query;
  String offset;

//  InlineQuery(this.id, this.from, this.location, this.query, this.offset);

}

@Entity()
abstract class InlineQueryResult {
  String type;
  String id;

//  InlineQueryResult(this.type, this.id);

}

@Entity()
class InlineQueryResultArticle extends InlineQueryResult {
  String title;
  InputMessageContent input_message_content;
  InlineKeyboardMarkup reply_markup;
  String url;
  bool hide_url;
  String description;
  String thumb_url;
  String thumb_width;
  String thumb_height;

//  InlineQueryResultArticle(String id, this.title, this.input_message_content,
//      {this.reply_markup, this.url, this.hide_url, this.description,
//        this.thumb_url, this.thumb_width, this.thumb_height})
//      : super('article', id);

}

@Entity()
class InlineQueryResultPhoto extends InlineQueryResult {
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

//  InlineQueryResultPhoto(String id, this.photo_url, this.thumb_url,
//      {this.photo_width, this.photo_height, this.title, this.description,
//        this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('photo', id);

}

@Entity()
class InlineQueryResultGif extends InlineQueryResult {
  String gif_url;
  int gif_width;
  int gif_height;
  int gif_duration;
  String thumb_url;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultGif(String id, this.gif_url,
//      {this.gif_width, this.gif_height, this.gif_duration, this.thumb_url,
//        this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('gif', id);

}

@Entity()
class InlineQueryResultMpeg4Gif extends InlineQueryResult {
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

//  InlineQueryResultMpeg4Gif(String id, this.mpeg4_url,
//      {this.mpeg4_width, this.mpeg4_height, this.mpeg4_duration, this.thumb_url,
//        this.title, this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('mpeg4_gif', id);

}

@Entity()
class InlineQueryResultVideo extends InlineQueryResult {
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

//  InlineQueryResultVideo(String id, this.video_url, this.mime_type,
//      this.thumb_url, this.title,
//      {this.caption, this.parse_mode, this.video_width,
//        this.video_height, this.video_duration, this.description,
//        this.reply_markup, this.input_message_content})
//      : super('video', id);

}

@Entity()
class InlineQueryResultAudio extends InlineQueryResult {
  String audio_url;
  String title;
  String caption;
  String parse_mode;
  String performer;
  int audio_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultAudio(String id, this.audio_url, this.title, this.caption,
//      {this.parse_mode, this.performer, this.audio_duration, this.reply_markup,
//        this.input_message_content})
//      : super('audio', id);

}

@Entity()
class InlineQueryResultDocument extends InlineQueryResult {
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

//  InlineQueryResultDocument(String id, this.title, this.caption, this.parse_mode,
//      this.document_url, this.mime_type,
//      {this.description, this.reply_markup, this.input_message_content,
//        this.thumb_url, this.thumb_width, this.thumb_height})
//      : super('document', id);

}

@Entity()
class InlineQueryResultLocation extends InlineQueryResult {
  double latitude;
  double longitude;
  String title;
  int live_period;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

//  InlineQueryResultLocation(String id, this.latitude, this.longitude, this.title,
//      {this.live_period, this.reply_markup, this.input_message_content,
//        this.thumb_url, this.thumb_width, this.thumb_height})
//      : super('location', id);

}

@Entity()
class InlineQueryResultVenue extends InlineQueryResult {
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

//  InlineQueryResultVenue(String id, this.latitude, this.longitude, this.title,
//      this.address,
//      {this.foursquare_id, this.reply_markup, this.input_message_content,
//        this.thumb_url, this.thumb_width, this.thumb_height})
//      : super('venue', id);

}

@Entity()
class InlineQueryResultContact extends InlineQueryResult {
  String phone_number;
  String first_name;
  String last_name;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

//  InlineQueryResultContact(String id, this.phone_number, this.first_name,
//      {this.last_name, this.reply_markup, this.input_message_content,
//        this.thumb_url, this.thumb_width, this.thumb_height})
//      : super('contact', id);

}

@Entity()
class InlineQueryResultGame extends InlineQueryResult {
  String game_short_name;
  InlineKeyboardMarkup reply_markup;

//  InlineQueryResultGame(String id, this.game_short_name, this.reply_markup)
//      : super('game', id);

}

@Entity()
class InlineQueryResultCachedPhoto extends InlineQueryResult {
  String photo_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedPhoto(String id, this.photo_file_id,
//      {this.title, this.description, this.caption, this.parse_mode,
//        this.reply_markup, this.input_message_content})
//      : super('photo', id);

}

@Entity()
class InlineQueryResultCachedGif extends InlineQueryResult {
  String gif_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedGif(String id, this.gif_file_id,
//      {this.title, this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('gif', id);

}

@Entity()
class InlineQueryResultCachedMpeg4Gif extends InlineQueryResult {
  String mpeg4_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedMpeg4Gif(String id, this.mpeg4_file_id, this.title,
//      this.caption, this.parse_mode, this.reply_markup, this.input_message_content)
//      : super('mpeg4_gif', id);

}

@Entity()
class InlineQueryResultCachedSticker extends InlineQueryResult {
  String sticker_file_id;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedSticker(String id, this.sticker_file_id,
//      {this.reply_markup, this.input_message_content})
//      : super('sticker', id);

}

@Entity()
class InlineQueryResultCachedDocument extends InlineQueryResult {
  String document_file_id;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedDocument(String id, this.document_file_id,
//      {this.description, this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('document', id);

}

@Entity()
class InlineQueryResultCachedVideo extends InlineQueryResult {
  String video_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedVideo(String id, this.video_file_id,
//      {this.title, this.description, this.caption, this.parse_mode,
//        this.reply_markup, this.input_message_content})
//      : super('video', id);
}

@Entity()
class InlineQueryResultCachedVoice extends InlineQueryResult {
  String voice_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedVoice(String id, this.voice_file_id,
//      {this.title, this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('voice', id);
}

@Entity()
class InlineQueryResultCachedAudio extends InlineQueryResult {
  String audio_file_id;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

//  InlineQueryResultCachedAudio(String id, this.audio_file_id,
//      {this.caption, this.parse_mode, this.reply_markup,
//        this.input_message_content})
//      : super('audio', id);
}

@Entity()
class InputMessageContent {}

@Entity()
class InputTextMessageContent extends InputMessageContent {
  String message_text;
  String parse_mode;
  bool disable_web_page_preview;

//  InputTextMessageContent(this.message_text,
//      {this.parse_mode, this.disable_web_page_preview});

}

@Entity()
class InputLocationMessageContent extends InputMessageContent {
  double latitude;
  double longitude;
  int live_period;

//  InputLocationMessageContent(this.latitude, this.longitude,
//      {this.live_period});

}

@Entity()
class InputVenueMessageContent extends InputMessageContent {
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;

//  InputVenueMessageContent(this.latitude, this.longitude, this.title,
//      this.address,
//      {this.foursquare_id});

}

@Entity()
class InputContactMessageContent extends InputMessageContent {
  String phone_number;
  String first_name;
  String last_name;

//  InputContactMessageContent(this.phone_number, this.first_name,
//      {this.last_name});

}

@Entity()
class ChosenInlineResult {
  String result_id;
  User from;
  Location location;
  String inline_message_id;
  String query;

//  ChosenInlineResult(this.result_id, this.from, this.query,
//    {this.location, this.inline_message_id});

}

@Entity()
class LabeledPrice {
  String label;
  int amount;

//  LabeledPrice(this.label, this.amount);

}

@Entity()
class Invoice {
  String title;
  String description;
  String start_parameter;
  String currency;
  int total_amount;

//  Invoice(this.title, this.description, this.start_parameter, this.currency,
//      this.total_amount);

}

@Entity()
class ShippingAddress {
  String country_code;
  String state;
  String city;
  String street_line1;
  String street_line2;
  String post_code;

//  ShippingAddress(this.country_code, this.state, this.city, this.street_line1,
//      this.street_line2, this.post_code);

}

@Entity()
class OrderInfo {
  String name;
  String phone_number;
  String email;
  ShippingAddress shippingAddress;

//  OrderInfo({this.name, this.phone_number, this.email, this.shippingAddress});

}

@Entity()
class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;

//  ShippingOption(this.id, this.title, this.prices);

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

//  SuccessfulPayment(this.currency, this.total_amount, this.invoice_payload,
//  this.telegram_payment_charge_id, this.provider_payment_charge_id,
//    {this.shipping_option_id, this.order_info});

}

@Entity()
class ShippingQuery {
  String id;
  User from;
  String invoice_payload;
  ShippingAddress shipping_address;

//  ShippingQuery(this.id, this.from, this.invoice_payload,
//      this.shipping_address);

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

//  PreCheckoutQuery(this.id, this.from, this.currency, this.total_amount,
//      this.invoice_payload,
//      {this.shipping_option_id, this.order_info});

}

@Entity()
class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String text;
  List<MessageEntity> text_entities;
  Animation animation;

//  Game(this.title, this.description, this.photo,
//      {this.text, this.text_entities, this.animation});

}

@Entity()
class Animation {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;

//  Animation(this.file_id,
//      {this.thumb, this.file_name, this.mime_type, this.file_size});

}

@Entity()
class CallbackGame{}

@Entity()
class GameHeightScore {
  int position;
  User user;
  int score;

//  GameHeightScore(this.position, this.user, this.score);

}