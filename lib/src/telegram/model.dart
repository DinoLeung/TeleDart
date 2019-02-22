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

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

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

/// Contains information about the current status of a webhook.
///
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable()
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

/// This object represents a Telegram user or bot.
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable()
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

/// This object represents a chat.
///
/// https://core.telegram.org/bots/api#chat
@JsonSerializable()
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
      this.passport_data});

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

/// This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
///
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable()
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

/// This object represents one size of a photo or a [file] / [sticker] thumbnail.
///
/// https://core.telegram.org/bots/api#photosize
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
@JsonSerializable()
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

/// This object represents an audio file to be treated as music by the Telegram clients.
///
/// https://core.telegram.org/bots/api#audio
@JsonSerializable()
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

/// This object represents a general file (as opposed to [photos], [voice messages] and [audio files]).
///
/// https://core.telegram.org/bots/api#document
///
/// [photos]: https://core.telegram.org/bots/api#photosize
/// [voice messages]: https://core.telegram.org/bots/api#voice
/// [audio files]: https://core.telegram.org/bots/api#audio
@JsonSerializable()
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

/// This object represents a video file.
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable()
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

/// This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).
///
/// https://core.telegram.org/bots/api#animation
@JsonSerializable()
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

///This object represents a voice note.
///
/// https://core.telegram.org/bots/api#voice
@JsonSerializable()
class Voice {
  String file_id;
  int duration;
  String mime_type;
  int file_size;
  Voice({this.file_id, this.duration, this.mime_type, this.file_size});
  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceToJson(this);
}

/// This object represents a [video message] (available in Telegram apps as of [v.4.0]).
///
/// https://core.telegram.org/bots/api#videonote
///
/// [video message]: https://telegram.org/blog/video-messages-and-telescope
/// [v.4.0]: https://telegram.org/blog/video-messages-and-telescope
@JsonSerializable()
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

/// This object represents a phone contact.
///
/// https://core.telegram.org/bots/api#contact
@JsonSerializable()
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

/// This object represents a point on the map.
///
/// https://core.telegram.org/bots/api#location
@JsonSerializable()
class Location {
  double longitude;
  double latitude;
  Location({this.longitude, this.latitude});
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LocationToJson(this);
}

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable()
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

/// This object represent a user's profile pictures.
///
/// https://core.telegram.org/bots/api#userprofilephotos
@JsonSerializable()
class UserProfilePhotos {
  int total_count;
  List<List<PhotoSize>> photos;
  UserProfilePhotos({this.total_count, this.photos});
  factory UserProfilePhotos.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePhotosFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfilePhotosToJson(this);
}

/// This object represents a file ready to be downloaded.
/// The file can be downloaded via the link [https://api.telegram.org/file/bot<token>/<file_path>].
/// It is guaranteed that the link will be valid for at least 1 hour.
/// When the link expires, a new one can be requested by calling [getFile].
///
/// *Maximum file size to download is 20 MB*
///
/// https://core.telegram.org/bots/api#file
///
/// [getFile]: https://core.telegram.org/bots/api#getfile
@JsonSerializable()
class File {
  String file_id;
  int file_size;
  String file_path;
  File({this.file_id, this.file_size, this.file_path});
  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
  Map<String, dynamic> toJson() => _$FileToJson(this);
}

/// Object for an [inline keyboard], [custom reply keyboard], instructions to remove reply keyboard or to force a reply from the user.
/// * [ReplyKeyboardMarkup](https://core.telegram.org/bots/api#replykeyboardmarkup)
/// * [ReplyKeyboardRemove](https://core.telegram.org/bots/api#replykeyboardremove)
/// * [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
/// * [ForceReply](https://core.telegram.org/bots/api#forcereply)
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [custom reply keyboard]: https://core.telegram.org/bots#keyboards
@JsonSerializable()
// abstract class ReplyMarkup {}
class ReplyMarkup {
  ReplyMarkup();
  factory ReplyMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}

/// This object represents a [custom keyboard] with reply options
/// (see [Introduction to bots] for details and examples).
///
/// https://core.telegram.org/bots/api#replykeyboardmarkup
///
/// [custom keyboard]: https://core.telegram.org/bots#keyboards
/// [Introduction to bots]: https://core.telegram.org/bots#keyboards
@JsonSerializable()
class ReplyKeyboardMarkup implements ReplyMarkup {
  List<List<KeyboardButton>> keyboard;
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

/// This object represents one button of the reply keyboard.
/// For simple text buttons String can be used instead of this object to specify text of the button.
/// Optional fields are mutually exclusive.
///
/// **Note:** request_contact and request_location options will only work in Telegram versions
/// released after 9 April, 2016. Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable()
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;
  KeyboardButton({this.text, this.request_contact, this.request_location});
  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);
  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}

/// Upon receiving a message with this object,
/// Telegram clients will remove the current custom keyboard and display the default letter-keyboard.
/// By default, custom keyboards are displayed until a new keyboard is sent by a bot.
/// An exception is made for one-time keyboards that are hidden immediately after the user presses a
/// button (see [ReplyKeyboardMarkup]).
///
/// https://core.telegram.org/bots/api#replykeyboardremove
///
/// [ReplyKeyboardMarkup]: https://core.telegram.org/bots/api#replykeyboardmarkup
@JsonSerializable()
class ReplyKeyboardRemove implements ReplyMarkup {
  bool remove_keyboard;
  bool selective;
  ReplyKeyboardRemove({this.remove_keyboard, this.selective});
  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardRemoveFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}

/// This object represents an [inline keyboard] that appears right next to the message it belongs to.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016. Older clients
/// will display *unsupported message*.
///
/// https://core.telegram.org/bots/api#inlinekeyboardmarkup
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
@JsonSerializable()
class InlineKeyboardMarkup implements ReplyMarkup {
  List<List<InlineKeyboardButton>> inline_keyboard;
  InlineKeyboardMarkup({this.inline_keyboard});
  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$InlineKeyboardMarkupToJson(this);
}

/// This object represents one button of an inline keyboard.
/// You **must** use exactly one of the optional fields.
///
/// https://core.telegram.org/bots/api#inlinekeyboardbutton
@JsonSerializable()
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

/// This object represents an incoming callback query from a callback button in an [inline keyboard].
/// If the button that originated the query was attached to a message sent by the bot,
/// the field *message* will be present.
/// If the button was attached to a message sent via the bot (in [inline mode]),
/// the field *inline_message_id* will be present.
/// Exactly one of the fields *data* or *game_short_name* will be present.
///
/// **NOTE:** After the user presses a callback button,
/// Telegram clients will display a progress bar until you call [answerCallbackQuery].
/// It is, therefore, necessary to react by calling [answerCallbackQuery] even if no notification
/// to the user is needed (e.g., without specifying any of the optional parameters).
///
/// https://core.telegram.org/bots/api#callbackquery
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [inline mode]: https://core.telegram.org/bots/api#inline-mode
/// [answerCallbackQuery]: https://core.telegram.org/bots/api#answercallbackquery
@JsonSerializable()
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

/// Upon receiving a message with this object,
/// Telegram clients will display a reply interface to the user
/// (act as if the user has selected the bot‘s message and tapped ’Reply').
/// This can be extremely useful if you want to create user-friendly step-by-step interfaces
/// without having to sacrifice [privacy mode].
///
/// **Example:** A [poll bot] for groups runs in privacy mode
/// (only receives commands, replies to its messages and mentions).
/// There could be two ways to create a new poll:
/// * Explain the user how to send a command with parameters (e.g. /newpoll question answer1 answer2).
/// May be appealing for hardcore users but lacks modern day polish.
/// * Guide the user through a step-by-step process. ‘Please send me your question’,
/// ‘Cool, now let’s add the first answer option‘, ’Great. Keep adding answer options,
/// then send /done when you‘re ready’.
///
/// The last option is definitely more attractive.
/// And if you use [ForceReply] in your bot‘s questions,
/// it will receive the user’s answers even if it only receives replies,
/// commands and mentions — without any extra work for the user.
///
/// https://core.telegram.org/bots/api#forcereply
///
/// [privacy mode]: https://core.telegram.org/bots#privacy-mode
/// [poll bot]: https://t.me/PollBot
/// [ForceReply]: https://core.telegram.org/bots/api#forcereply
@JsonSerializable()
class ForceReply implements ReplyMarkup {
  bool force_reply;
  bool selective;
  ForceReply({this.force_reply, this.selective});
  factory ForceReply.fromJson(Map<String, dynamic> json) =>
      _$ForceReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ForceReplyToJson(this);
}

/// This object represents a chat photo.
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable()
class ChatPhoto {
  String small_file_id;
  String big_file_id;
  ChatPhoto({this.small_file_id, this.big_file_id});
  factory ChatPhoto.fromJson(Map<String, dynamic> json) =>
      _$ChatPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}

/// This object contains information about one member of a chat.
///
/// https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
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

/// Contains information about why a request was unsuccessful.
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable()
class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;
  ResponseParameters({this.migrate_to_chat_id, this.retry_after});
  factory ResponseParameters.fromJson(Map<String, dynamic> json) =>
      _$ResponseParametersFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseParametersToJson(this);
}

/// This object represents the content of a media message to be sent. It should be one of
/// * [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
/// * [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
/// * [InputMediaAudio](https://core.telegram.org/bots/api#inputmediaaudio)
/// * [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
/// * [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable()
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

/// Represents a photo to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaphoto
@JsonSerializable()
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

/// Represents a video to be sent.
///
/// https://core.telegram.org/bots/api#inputmediavideo
@JsonSerializable()
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

/// Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaanimation
@JsonSerializable()
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

/// Represents an audio file to be treated as music to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaaudio
@JsonSerializable()
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

/// Represents a general file to be sent.
///
/// https://core.telegram.org/bots/api#inputmediadocument
@JsonSerializable()
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

/// This object represents a sticker.
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable()
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

/// This object represents a sticker set.
///
/// https://core.telegram.org/bots/api#stickerset
@JsonSerializable()
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

/// This object describes the position on faces where a mask should be placed by default.
///
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable()
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

/// This object represents an incoming inline query.
/// When the user sends an empty query,
/// your bot could return some default or trending results.
///
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable()
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

/// This object represents one result of an inline query.
/// Telegram clients currently support results of the following 20 types:
/// * [InlineQueryResultCachedAudio](https://core.telegram.org/bots/api#inlinequeryresultcachedaudio)
/// * [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
/// * [InlineQueryResultCachedGif](https://core.telegram.org/bots/api#inlinequeryresultcachedgif)
/// * [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
/// * [InlineQueryResultCachedPhoto](https://core.telegram.org/bots/api#inlinequeryresultcachedphoto)
/// * [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
/// * [InlineQueryResultCachedVideo](https://core.telegram.org/bots/api#inlinequeryresultcachedvideo)
/// * [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
/// * [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
/// * [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
/// * [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
/// * [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
/// * [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
/// * [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
/// * [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
/// * [InlineQueryResultMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif)
/// * [InlineQueryResultPhoto](https://core.telegram.org/bots/api#inlinequeryresultphoto)
/// * [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
/// * [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
/// * [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
///
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable()
// abstract class InlineQueryResult {
class InlineQueryResult {
  String type;
  String id;
  InlineQueryResult({this.type, this.id});
  factory InlineQueryResult.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryResultToJson(this);
}

/// Represents a link to an article or web page.
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable()
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
      this.type = 'article',
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

/// Represents a link to a photo.
/// By default, this photo will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the photo.
///
/// https://core.telegram.org/bots/api#inlinequeryresultphoto
@JsonSerializable()
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
      this.type = 'photo',
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

/// Represents a link to an animated GIF file.
/// By default, this animated GIF file will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable()
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
      this.type = 'gif',
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

/// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
/// By default, this animated MPEG-4 file will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable()
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
      this.type = 'mpeg4_gif',
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

/// Represents a link to a page containing an embedded video player or a video file.
/// By default, this video file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the video.
///
/// If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube),
/// you **must** replace its content using *input_message_content*.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable()
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
      this.type = 'video',
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

/// Represents a link to an mp3 audio file.
/// By default, this audio file will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the audio.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable()
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
      this.type = 'audio',
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

/// Represents a link to a voice recording in an .ogg container encoded with OPUS.
/// By default, this voice recording will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the the voice message.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
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
      this.type = 'voice',
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

/// Represents a link to a file. By default, this file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the file.
/// Currently, only **.PDF** and **.ZIP** files can be sent using this method.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultdocument
@JsonSerializable()
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
      this.type = 'document',
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

/// Represents a location on a map.
/// By default, the location will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the location.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable()
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
      this.type = 'location',
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

/// Represents a venue.
/// By default, the venue will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the venue.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable()
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
      this.type = 'venue',
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

/// Represents a contact with a phone number.
/// By default, the contact will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the contact.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcontact
@JsonSerializable()
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
      this.type = 'contact',
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

/// Represents a [Game].
///
/// **Note:** This will only work in Telegram versions released after October 1, 2016.
/// Older clients will not display any inline results if a game result is among them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgame
///
/// [Game]: https://core.telegram.org/bots/api#games
@JsonSerializable()
class InlineQueryResultGame implements InlineQueryResult {
  @override
  String id;
  @override
  String type = 'game';
  String game_short_name;
  InlineKeyboardMarkup reply_markup;
  InlineQueryResultGame(
      {this.id, this.type = 'game', this.game_short_name, this.reply_markup});
  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}

/// Represents a link to a photo stored on the Telegram servers.
/// By default, this photo will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the photo.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
@JsonSerializable()
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
      this.type = 'photo',
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

/// Represents a link to an animated GIF file stored on the Telegram servers.
/// By default, this animated GIF file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedgif
@JsonSerializable()
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
      this.type = 'gif',
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

/// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers.
/// By default, this animated MPEG-4 file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable()
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
      this.type = 'mpeg4_gif',
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

/// Represents a link to a sticker stored on the Telegram servers.
/// By default, this sticker will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the sticker.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedsticker
@JsonSerializable()
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
      this.type = 'sticker',
      this.sticker_file_id,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedStickerFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedStickerToJson(this);
}

/// Represents a link to a file stored on the Telegram servers.
/// By default, this file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the file.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
@JsonSerializable()
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
      this.type = 'document',
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

/// Represents a link to a video file stored on the Telegram servers.
/// By default, this video file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the video.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
@JsonSerializable()
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
      this.type = 'video',
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

/// Represents a link to a voice message stored on the Telegram servers.
/// By default, this voice message will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the voice message.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable()
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
      this.type = 'voice',
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

/// Represents a link to an mp3 audio file stored on the Telegram servers.
/// By default, this audio file will be sent by the user.
/// Alternatively,
///  you can use *input_message_content* to send a message with the specified content instead of the audio.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
@JsonSerializable()
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
      this.type = 'audio',
      this.audio_file_id,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});
  factory InlineQueryResultCachedAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedAudioFromJson(json);
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedAudioToJson(this);
}

/// This object represents the content of a message to be sent as a result of an inline query.
/// Telegram clients currently support the following 4 types:
/// * [InputTextMessageContent](https://core.telegram.org/bots/api#inputtextmessagecontent)
/// * [InputLocationMessageContent](https://core.telegram.org/bots/api#inputlocationmessagecontent)
/// * [InputVenueMessageContent](https://core.telegram.org/bots/api#inputvenuemessagecontent)
/// * [InputContactMessageContent](https://core.telegram.org/bots/api#inputcontactmessagecontent)
///
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
// abstract class InputMessageContent {
class InputMessageContent {
  InputMessageContent();
  factory InputMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputMessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}

/// Represents the [content] of a text message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputtextmessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
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

/// Represents the [content] of a location message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
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

/// Represents the [content] of a venue message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputvenuemessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
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

/// Represents the [content] of a contact message to be sent as the result of an inline query.
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
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

/// Represents a [result] of an inline query that was chosen by the user and sent to their chat partner.
///
/// **Note:** It is necessary to enable [inline feedback] via [@Botfather] in order to receive these objects in updates.
///
/// https://core.telegram.org/bots/api#choseninlineresult
///
/// [result]: https://core.telegram.org/bots/api#inlinequeryresult
/// [inline feedback]: https://core.telegram.org/bots/inline#collecting-feedback
/// [@Botfather]: https://t.me/botfather
@JsonSerializable()
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

/// This object represents a portion of the price for goods or services.
///
/// https://core.telegram.org/bots/api#labeledprice
@JsonSerializable()
class LabeledPrice {
  String label;
  int amount;
  LabeledPrice({this.label, this.amount});
  factory LabeledPrice.fromJson(Map<String, dynamic> json) =>
      _$LabeledPriceFromJson(json);
  Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}

/// This object contains basic information about an invoice.
///
/// https://core.telegram.org/bots/api#invoice
@JsonSerializable()
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

/// This object represents a shipping address.
///
/// https://core.telegram.org/bots/api#shippingaddress
@JsonSerializable()
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

/// This object represents information about an order.
///
/// https://core.telegram.org/bots/api#orderinfo
@JsonSerializable()
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

/// This object represents one shipping option.
///
/// https://core.telegram.org/bots/api#shippingoption
@JsonSerializable()
class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;
  ShippingOption({this.id, this.title, this.prices});
  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}

/// This object contains basic information about a successful payment.
///
/// https://core.telegram.org/bots/api#successfulpayment
@JsonSerializable()
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

/// This object contains information about an incoming shipping query.
///
/// https://core.telegram.org/bots/api#shippingquery
@JsonSerializable()
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

/// This object contains information about an incoming pre-checkout query.
///
/// https://core.telegram.org/bots/api#precheckoutquery
@JsonSerializable()
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

/// Contains information about Telegram Passport data shared with the bot by the user.
///
/// https://core.telegram.org/bots/api#passportdata
@JsonSerializable()
class PassportData {
  List<EncryptedPassportElement> data;
  EncryptedCredentials credentials;
  PassportData({this.data, this.credentials});
  factory PassportData.fromJson(Map<String, dynamic> json) =>
      _$PassportDataFromJson(json);
  Map<String, dynamic> toJson() => _$PassportDataToJson(this);
}

/// This object represents a file uploaded to Telegram Passport.
/// Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
///
/// https://core.telegram.org/bots/api#passportfile
@JsonSerializable()
class PassportFile {
  String file_id;
  int file_size;
  int file_date;
  PassportFile({this.file_id, this.file_size, this.file_date});
  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);
  Map<String, dynamic> toJson() => _$PassportFileToJson(this);
}

/// Contains information about documents or other Telegram Passport elements shared with the bot by the user.
///
/// https://core.telegram.org/bots/api#encryptedpassportelement
@JsonSerializable()
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

/// Contains data required for decrypting and authenticating [EncryptedPassportElement].
/// See the [Telegram Passport Documentation] for a complete description of the data decryption and authentication processes.
///
/// https://core.telegram.org/bots/api#encryptedcredentials
///
/// [EncryptedPassportElement]: https://core.telegram.org/bots/api#encryptedpassportelement
/// [Telegram Passport Documentation]: https://core.telegram.org/passport#receiving-information
@JsonSerializable()
class EncryptedCredentials {
  String data;
  String hash;
  String secret;
  EncryptedCredentials({this.data, this.hash, this.secret});
  factory EncryptedCredentials.fromJson(Map<String, dynamic> json) =>
      _$EncryptedCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptedCredentialsToJson(this);
}

/// This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user.
/// It should be one of:
/// * [PassportElementErrorDataField](https://core.telegram.org/bots/api#passportelementerrordatafield)
/// * [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
/// * [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
/// * [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
/// * [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
/// * [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
/// * [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
/// * [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
/// * [PassportElementErrorUnspecified](https://core.telegram.org/bots/api#passportelementerrorunspecified)
///
/// https://core.telegram.org/bots/api#passportelementerror
@JsonSerializable()
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

/// Represents an issue in one of the data fields that was provided by the user.
/// The error is considered resolved when the field's value changes.
///
/// https://core.telegram.org/bots/api#passportelementerrordatafield
@JsonSerializable()
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

/// Represents an issue with the front side of a document.
/// The error is considered resolved when the file with the front side of the document changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfrontside
@JsonSerializable()
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

/// Represents an issue with the reverse side of a document.
/// The error is considered resolved when the file with reverse side of the document changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorreverseside
@JsonSerializable()
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

/// Represents an issue with the selfie with a document.
/// The error is considered resolved when the file with the selfie changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorselfie
@JsonSerializable()
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

/// Represents an issue with a document scan.
/// The error is considered resolved when the file with the document scan changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfile
@JsonSerializable()
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

/// Represents an issue with a list of scans.
/// The error is considered resolved when the list of files containing the scans changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfiles
@JsonSerializable()
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

/// Represents an issue with one of the files that constitute the translation of a document.
/// The error is considered resolved when the file changes.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfile
@JsonSerializable()
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

/// Represents an issue with the translated version of a document.
/// The error is considered resolved when a file with the document translation change.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfiles
@JsonSerializable()
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

/// Represents an issue in an unspecified place.
/// The error is considered resolved when new data is added.
///
/// https://core.telegram.org/bots/api#passportelementerrorunspecified
@JsonSerializable()
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

/// This object represents a game.
/// Use BotFather to create and edit games, their short names will act as unique identifiers.
///
/// https://core.telegram.org/bots/api#game
@JsonSerializable()
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

/// A placeholder, currently holds no information.
/// Use [BotFather] to set up your game.
///
/// https://core.telegram.org/bots/api#callbackgame
///
/// [BotFather]: https://t.me/botfather
@JsonSerializable()
class CallbackGame {
  CallbackGame();
  factory CallbackGame.fromJson(Map<String, dynamic> json) =>
      _$CallbackGameFromJson(json);
  Map<String, dynamic> toJson() => _$CallbackGameToJson(this);
}

/// This object represents one row of the high scores table for a game.
///
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable()
class GameHighScore {
  int position;
  User user;
  int score;
  GameHighScore({this.position, this.user, this.score});
  factory GameHighScore.fromJson(Map<String, dynamic> json) =>
      _$GameHighScoreFromJson(json);
  Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}
