class Update {
  int update_id;
  Message message;
  Message edited_messaged;
  Message channel_post;
  InlineQuery inline_query;
  ChosenInlineResult chosen_inline_result;
  CallbackQuery callback_query;
  PreCheckoutQuery pre_checkout_query;

  Update(this.update_id,
      {this.message, this.edited_messaged, this.channel_post,
        this.inline_query, this.chosen_inline_result,
        this.callback_query, this.pre_checkout_query});

}

class User {
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;

  User(this.id, this.is_bot, this.first_name,
      {this.last_name, this.username, this.language_code});

}

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

  Chat(this.id, this.type,
      {this.title, this.username, this.first_name, this.last_name,
        this.all_members_are_administrators, this.photo,
        this.description, this.invite_link, this.pinned_message,
        this.sticker_set_name, this.can_set_sticker_set});

}

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

  Message(this.message_id, this.from, this.date, this.chat,
      {this.forward_from, this.forward_from_char, this.forward_from_message_id,
        this.forward_signature, this.forward_date, this.reply_to_message,
        this.edit_date, this.media_group_id, this.author_signature, this.text,
        this.entities, this.caption_entities, this.audio, this.document,
        this.game, this.photo, this.sticker, this.video, this.voice,
        this.video_note, this.caption, this.contact, this.location, this.venue,
        this.new_chat_members, this.left_chat_member, this.new_chat_title,
        this.new_chat_photo, this.delete_chat_photo, this.group_chat_created,
        this.supergroup_chat_created, this.channel_chat_created,
        this.migrate_to_chat_id, this.migrate_from_chat_id, this.pinned_message,
        this.invoice, this.successful_payment, this.connected_website});

}

class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;

  MessageEntity(this.type, this.offset, this.length,
      {this.url, this.user});

}

class PhotoSize {
  String file_id;
  int width;
  int height;
  int file_size;

  PhotoSize(this.file_id, this.width, this.height,
      {this.file_size});

}

class Audio {
  String file_id;
  int duration;
  String performer;
  String title;
  String mime_type;
  int file_size;

  Audio(this.file_id, this.duration,
      {this.performer, this.title, this.mime_type, this.file_size});

}

class Document {
  String file_id;
  PhotoSize thumb;
  String file_name;
  String mimi_type;
  int file_size;

  Document(this.file_id,
      {this.thumb, this.file_name, this.mimi_type, this.file_size});

}

class Video {
  String file_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mime_type;
  int file_size;

  Video(this.file_id, this.width, this.height, this.duration,
      {this.thumb, this.mime_type, this.file_size});

}

class Voice {
  String file_id;
  int duration;
  String mime_type;
  int file_size;

  Voice(this.file_id, this.duration,
      {this.mime_type, this.file_size});

}

class VideoNote {
  String file_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;

  VideoNote(this.file_id, this.length, this.duration,
      {this.thumb, this.file_size});

}

class Contact {
  String phone_number;
  String first_name;
  String last_name;
  int user_id;

  Contact(this.phone_number, this.first_name,
      {this.last_name, this.user_id});

}

class Location {
  double longitude;
  double latitude;

  Location(this.longitude, this.latitude);

}

class Venue {
  Location location;
  String title;
  String address;
  String foursquare_id;

  Venue(this.location, this.title, this.address,
      {this.foursquare_id});

}

class UserProfilePhotos {
  int total_count;
  List<PhotoSize> photos;

  UserProfilePhotos(this.total_count, this.photos);

}

class File {
  String file_id;
  int file_size;
  String file_path;

  File(this.file_id, this.file_size, this.file_path);

}

class ReplyKeyboardMarkup {
  List<KeyboardButton> keyboard;
  bool resize_keyboard;
  bool one_time_keyboard;
  bool selective;

  ReplyKeyboardMarkup(this.keyboard,
      {this.resize_keyboard, this.one_time_keyboard, this.selective});

}

class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;

  KeyboardButton(this.text,
      {this.request_contact, this.request_location});

}

class ReplyKeyboardRemove {
  bool remove_keyboard;
  bool selective;

  ReplyKeyboardRemove(this.remove_keyboard,
      {this.selective});

}

class InlineKeyboardMarkup {
  List<InlineKeyboardButton> inline_keyboard;

  InlineKeyboardMarkup(this.inline_keyboard);

}

class InlineKeyboardButton {
  String text;
  String url;
  String callback_data;
  String switch_inline_query;
  String switch_inline_query_current_chat;
  CallbackGame callback_game;
  bool pay;

  InlineKeyboardButton(this.text,
      {this.url, this.callback_data, this.switch_inline_query,
        this.switch_inline_query_current_chat, this.callback_game, this.pay});

}

class CallbackQuery {
  String id;
  User from;
  Message message;
  String inline_message_is;
  String chat_instance;
  String data;
  String game_short_name;

  CallbackQuery(this.id, this.from,
      {this.message, this.inline_message_is, this.chat_instance,
        this.data, this.game_short_name});

}

class ForceReply {
  bool forceReply;
  bool selective;

  ForceReply(this.forceReply,
      {this.selective});

}

class ChatPhoto {
  String small_file_id;
  String big_file_id;

  ChatPhoto(this.small_file_id, this.big_file_id);

}

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

  ChatMember(this.user, this.status,
      {this.until_date, this.can_be_edited, this.can_change_info,
        this.can_post_messages, this.can_edit_messages,
        this.can_delete_messages, this.can_invite_users,
        this.can_restrict_members, this.can_pin_messages,
        this.can_promote_members, this.can_send_message,
        this.can_send_media_messages, this.can_send_other_messages,
        this.can_add_web_page_previews});

}

class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;

  ResponseParameters(
      {this.migrate_to_chat_id, this.retry_after});

}

abstract class InputMedia {
  String type;
  String media;
  String caption;
  String parse_mode;

  InputMedia(this.type, this.media, this.caption, this.parse_mode);

}

class InputMediaPhoto extends InputMedia {
  InputMediaPhoto(String type, String media, String caption, String parse_mode)
      : super(type, media, caption, parse_mode);
}

class InputMediaVideo extends InputMedia {
  int width;
  int height;
  int duration;
  bool supports_streaming;

  InputMediaVideo(String type, String media, String caption, String parse_mode,
      {this.width, this.height, this.duration, this.supports_streaming})
      : super(type, media, caption, parse_mode);

}