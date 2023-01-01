/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2020  Dino PH Leung
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

import 'dart:async';

import '../../../teledart.dart';
import '../../telegram/model.dart';

/// A recieved message
///
/// It is the object which gets returned by listeners such as
/// [TeleDart.onMessage].
///
/// This class combines [Message] and [TeleDart]
/// to add the reply methods (like [reply] or [replyPhoto]),
/// which are shortcuts that let you automatically reply to
/// recieved messages.
class TeleDartMessage extends Message {
  final TeleDart _teledart;

  TeleDartMessage(this._teledart, Message message)
      : super(
          messageId: message.messageId,
          messageThreadId: message.messageThreadId,
          from: message.from,
          date: message.date,
          senderChat: message.senderChat,
          chat: message.chat,
          forwardFrom: message.forwardFrom,
          forwardFromChat: message.forwardFromChat,
          forwardFromMessageId: message.forwardFromMessageId,
          forwardSignature: message.forwardSignature,
          forwardSenderName: message.forwardSenderName,
          forwardDate: message.forwardDate,
          isTopicMessage: message.isTopicMessage,
          isAutomaticForward: message.isAutomaticForward,
          replyToMessage: message.replyToMessage,
          viaBot: message.viaBot,
          editDate: message.editDate,
          hasProtectedContent: message.hasProtectedContent,
          mediaGroupId: message.mediaGroupId,
          authorSignature: message.authorSignature,
          text: message.text,
          entities: message.entities,
          animation: message.animation,
          audio: message.audio,
          document: message.document,
          photo: message.photo,
          sticker: message.sticker,
          video: message.video,
          videoNote: message.videoNote,
          voice: message.voice,
          caption: message.caption,
          captionEntities: message.captionEntities,
          hasMediaSpoiler: message.hasMediaSpoiler,
          contact: message.contact,
          dice: message.dice,
          game: message.game,
          poll: message.poll,
          venue: message.venue,
          location: message.location,
          newChatMembers: message.newChatMembers,
          leftChatMember: message.leftChatMember,
          newChatTitle: message.newChatTitle,
          newChatPhoto: message.newChatPhoto,
          deleteChatPhoto: message.deleteChatPhoto,
          groupChatCreated: message.groupChatCreated,
          supergroupChatCreated: message.supergroupChatCreated,
          channelChatCreated: message.channelChatCreated,
          messageAutoDeleteTimerChanged: message.messageAutoDeleteTimerChanged,
          migrateToChatId: message.migrateToChatId,
          migrateFromChatId: message.migrateFromChatId,
          pinnedMessage: message.pinnedMessage,
          invoice: message.invoice,
          successfulPayment: message.successfulPayment,
          connectedWebsite: message.connectedWebsite,
          writeAccessAllowed: message.writeAccessAllowed,
          passportData: message.passportData,
          proximityAlertTriggered: message.proximityAlertTriggered,
          forumTopicCreated: message.forumTopicCreated,
          forumTopicEdited: message.forumTopicEdited,
          forumTopicClosed: message.forumTopicClosed,
          forumTopicReopened: message.forumTopicReopened,
          generalForumTopicHidden: message.generalForumTopicHidden,
          generalForumTopicUnhidden: message.generalForumTopicUnhidden,
          videoChatScheduled: message.videoChatScheduled,
          videoChatStarted: message.videoChatStarted,
          videoChatEnded: message.videoChatEnded,
          videoChatParticipantsInvited: message.videoChatParticipantsInvited,
          webAppData: message.webAppData,
          replyMarkup: message.replyMarkup,
        );

  /// Reply to the recieved message with text
  ///
  /// A wrapper around [TeleDart.replyMessage].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [String] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendmessage)
  /// for more information about those options.**
  Future<Message> reply(
    String text, {
    int? messageThreadId,
    bool withQuote = false,
    String? parseMode,
    List<MessageEntity>? entities,
    bool? disableWebPagePreview,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendMessage(chat.id, text,
          message_thread_id: messageThreadId ?? this.messageThreadId,
          parse_mode: parseMode,
          entities: entities,
          disable_web_page_preview: disableWebPagePreview,
          disable_notification: disableNotification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allowSendingWithoutReply,
          reply_markup: replyMarkup);

  /// Reply to the recieved message with an image
  ///
  /// A wrapper around [TeleDart.replyPhoto].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [photo] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendphoto)
  /// for more information about those options.**
  Future<Message> replyPhoto(
    dynamic photo, {
    int? message_thread_id,
    bool withQuote = false,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? has_spoiler,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendPhoto(chat.id, photo,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          has_spoiler: has_spoiler,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with an audio
  ///
  /// A wrapper around [TeleDart.replyAudio].
  /// On success, returns the sent [Message].
  ///
  /// Apart from an [audio] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendaudio)
  /// for more information about those options.**
  Future<Message> replyAudio(
    dynamic audio, {
    int? message_thread_id,
    bool withQuote = false,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    int? duration,
    String? performer,
    String? title,
    dynamic thumb,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendAudio(chat.id, audio,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          duration: duration,
          performer: performer,
          title: title,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a document
  ///
  /// A wrapper around [TeleDart.replyDocument].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [document] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#senddocument)
  /// for more information about those options.**
  Future<Message> replyDocument(
    dynamic document, {
    int? message_thread_id,
    bool withQuote = false,
    dynamic thumb,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendDocument(chat.id, document,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a video
  ///
  /// A wrapper around [TeleDart.replyVideo].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [video] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvideo)
  /// for more information about those options.**
  Future<Message> replyVideo(
    dynamic video, {
    int? message_thread_id,
    bool withQuote = false,
    int? duration,
    int? width,
    int? height,
    dynamic thumb,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? has_spoiler,
    bool? supports_streaming,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendVideo(chat.id, video,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          has_spoiler: has_spoiler,
          supports_streaming: supports_streaming,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with an animation (GIF or H.264/MPEG-4 AVC video without sound)
  ///
  /// A wrapper around [TeleDart.replyAnimation].
  /// On success, returns the sent [Message].
  ///
  /// Apart from an [animation] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendanimation)
  /// for more information about those options.**
  Future<Message> replyAnimation(
    dynamic animation, {
    int? message_thread_id,
    bool withQuote = false,
    int? duration,
    int? width,
    int? height,
    dynamic thumb,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? has_spoiler,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendAnimation(chat.id, animation,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          has_spoiler: has_spoiler,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a voice message
  ///
  /// A wrapper around [TeleDart.replyVoice].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [voice] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvoice)
  /// for more information about those options.**
  Future<Message> replyVoice(
    dynamic voice, {
    int? message_thread_id,
    bool withQuote = false,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendVoice(chat.id, voice,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a video note
  ///
  /// A wrapper around [TeleDart.replyVideoNote].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [video_note] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvideonote)
  /// for more information about those options.**
  Future<Message> replyVideoNote(
    dynamic video_note, {
    int? message_thread_id,
    bool withQuote = false,
    int? duration,
    int? length,
    dynamic thumb,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendVideoNote(chat.id, video_note,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          duration: duration,
          length: length,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a media group message (multiple media files)
  ///
  /// A wrapper around [TeleDart.replyMediaGroup].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [List<InputMedia>] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendmediagroup)
  /// for more information about those options.**
  Future<List<Message>> replyMediaGroup(
    List<InputMedia> media, {
    int? message_thread_id,
    bool withQuote = false,
    bool? disable_notification,
    bool? allow_sending_without_reply,
  }) =>
      _teledart.sendMediaGroup(chat.id, media,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply);

  /// Reply to the recieved message with a location
  ///
  /// A wrapper around [TeleDart.replyLocation].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [latitude] and a [longitude], it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendlocation)
  /// for more information about those options.**
  Future<Message> replyLocation(
    double latitude,
    double longitude, {
    int? message_thread_id,
    bool withQuote = false,
    double? horizontal_accuracy,
    int? live_period,
    int? heading,
    int? proximity_alert_radius,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendLocation(chat.id, latitude, longitude,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          horizontal_accuracy: horizontal_accuracy,
          live_period: live_period,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a venue message
  ///
  /// A wrapper around [TeleDart.replyVenue].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [latitude] and a [longitude] a [title] and an [address],
  /// it can also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvenue)
  /// for more information about those options.**
  Future<Message> replyVenue(
    double latitude,
    double longitude,
    String title,
    String address, {
    int? message_thread_id,
    bool withQuote = false,
    String? foursquare_id,
    String? foursquare_type,
    String? google_place_id,
    String? google_place_type,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendVenue(chat.id, latitude, longitude, title, address,
          message_thread_id: message_thread_id ?? message_thread_id,
          foursquare_id: foursquare_id,
          foursquare_type: foursquare_type,
          google_place_id: google_place_id,
          google_place_type: google_place_type,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a location
  ///
  /// A wrapper around [TeleDart.replyContact].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [phone_number] and a [first_name], it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendcontact)
  /// for more information about those options.**
  Future<Message> replyContact(
    String phone_number,
    String first_name, {
    int? message_thread_id,
    bool withQuote = false,
    String? last_name,
    String? vcard,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendContact(chat.id, phone_number, first_name,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          last_name: last_name,
          vcard: vcard,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a poll
  ///
  /// A wrapper around [TeleDart.replyPoll].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [question] and a [List<String>] of [options], it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendpoll)
  /// for more information about those options.**
  Future<Message> replyPoll(
    String question,
    List<String> options, {
    int? message_thread_id,
    bool withQuote = false,
    bool? is_anonymous,
    String? type,
    bool? allows_multiple_answers,
    int? correct_option_id,
    String? explanation,
    String? explanation_parse_mode,
    List<MessageEntity>? explanation_entities,
    int? open_period,
    int? close_date,
    bool? is_closed,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendPoll(chat.id, question, options,
          message_thread_id: message_thread_id ?? this.messageThreadId,
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
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a dice message
  ///
  /// A wrapper around [TeleDart.replyDice].
  /// On success, returns the sent [Message].
  ///
  /// It can take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#senddice)
  /// for more information about those options.**
  Future<Message> replyDice({
    int? message_thread_id,
    bool withQuote = false,
    String emoji = Dice.emojiDice,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendDice(chat.id,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          emoji: emoji,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with an invoice
  ///
  /// A wrapper around [TeleDart.replyInvoice].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [title], a [description], a [payload], a [provider_token] and a list of [prices],
  /// it can also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendinvoice)
  /// for more information about those options.**
  Future<Message> replyInvoice(
    String title,
    String description,
    String payload,
    String provider_token,
    String currency,
    List<LabeledPrice> prices, {
    int? message_thread_id,
    bool withQuote = false,
    int? max_tip_amount,
    List<int>? suggested_tip_amounts,
    String? start_parameter,
    String? provider_data,
    String? photo_url,
    int? photo_size,
    int? photo_width,
    int? photo_height,
    bool? need_name,
    bool? need_phone_number,
    bool? need_email,
    bool? need_shipping_address,
    bool? send_phone_number_to_provider,
    bool? send_email_to_provider,
    bool? is_flexible,
    bool? disable_notification,
    bool? protect_content,
    bool? allow_sending_without_reply,
    InlineKeyboardMarkup? reply_markup,
  }) =>
      _teledart.sendInvoice(chat.id, title, description, payload,
          provider_token, currency, prices,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          max_tip_amount: max_tip_amount,
          suggested_tip_amounts: suggested_tip_amounts,
          start_parameter: start_parameter,
          provider_data: provider_data,
          photo_url: photo_url,
          photo_size: photo_size,
          photo_width: photo_width,
          photo_height: photo_height,
          need_name: need_name,
          need_phone_number: need_phone_number,
          need_email: need_email,
          need_shipping_address: need_shipping_address,
          send_phone_number_to_provider: send_phone_number_to_provider,
          send_email_to_provider: send_email_to_provider,
          is_flexible: is_flexible,
          disable_notification: disable_notification,
          protect_content: protect_content,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with a game
  ///
  /// A wrapper around [TeleDart.replyGame].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [game_short_name], it can also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendgame)
  /// for more information about those options.**
  Future<Message> replyGame(
    String game_short_name, {
    int? message_thread_id,
    bool withQuote = false,
    bool? disable_notification,
    bool? protect_content,
    bool? allow_sending_without_reply,
    InlineKeyboardMarkup? reply_markup,
  }) =>
      _teledart.sendGame(chat.id, game_short_name,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          disable_notification: disable_notification,
          protect_content: protect_content,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to the recieved message with an image
  ///
  /// A wrapper around [TeleDart.replySticker].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [sticker] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendsticker)
  /// for more information about those options.**
  Future<Message> replySticker(
    dynamic sticker, {
    int? message_thread_id,
    bool withQuote = false,
    bool? disable_notification,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.sendSticker(chat.id, sticker,
          message_thread_id: message_thread_id ?? this.messageThreadId,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? messageId : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Copy the recieved message to a channel or chat.
  ///
  /// A wrapper around [TeleDart.copyMessage].
  /// On success, returns the sent [MessageId].
  ///
  /// Apart from a [chat_id] to copy the message to, it can
  /// also take some options that control the message
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#copymessage)
  /// for more information about those options.**
  Future<MessageId> copyTo(
    int chat_id, {
    int? message_thread_id,
    int? reply_to_message_id,
    String? caption,
    String? parse_mode,
    List<MessageEntity>? caption_entities,
    bool? disable_notification,
    bool? protect_content,
    bool? allow_sending_without_reply,
    ReplyMarkup? reply_markup,
  }) =>
      _teledart.copyMessage(chat_id, chat.id, messageId,
          message_thread_id: message_thread_id,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          protect_content: protect_content,
          reply_to_message_id: reply_to_message_id,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Forward the recieved message to a channel or chat.
  ///
  /// A wrapper around [TeleDart.forwardMessage].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [chat_id] to forward the message to, it can
  /// also take some options that control the message
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#forwardmessage)
  /// for more information about those options.**
  Future<Message> forwardTo(
    int chat_id, {
    int? message_thread_id,
    bool? disable_notification,
    bool? protect_content,
  }) =>
      _teledart.forwardMessage(chat_id, chat.id, messageId,
          message_thread_id: message_thread_id,
          disable_notification: disable_notification,
          protect_content: protect_content);
}
