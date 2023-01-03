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
    bool withQuote = false,
    String? parseMode,
    List<MessageEntity>? entities,
    bool? disableWebPagePreview,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendMessage(chat.id, text,
          messageThreadId: messageThreadId,
          parseMode: parseMode,
          entities: entities,
          disableWebPagePreview: disableWebPagePreview,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? hasSpoiler,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendPhoto(chat.id, photo,
          messageThreadId: messageThreadId,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          hasSpoiler: hasSpoiler,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    int? duration,
    String? performer,
    String? title,
    dynamic thumb,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendAudio(chat.id, audio,
          messageThreadId: messageThreadId,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          duration: duration,
          performer: performer,
          title: title,
          thumb: thumb,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    dynamic thumb,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendDocument(chat.id, document,
          messageThreadId: messageThreadId,
          thumb: thumb,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    int? duration,
    int? width,
    int? height,
    dynamic thumb,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? hasSpoiler,
    bool? supportsStreaming,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendVideo(chat.id, video,
          messageThreadId: messageThreadId,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          hasSpoiler: hasSpoiler,
          supportsStreaming: supportsStreaming,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    int? duration,
    int? width,
    int? height,
    dynamic thumb,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? hasSpoiler,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendAnimation(chat.id, animation,
          messageThreadId: messageThreadId,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          hasSpoiler: hasSpoiler,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendVoice(chat.id, voice,
          messageThreadId: messageThreadId,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Reply to the recieved message with a video note
  ///
  /// A wrapper around [TeleDart.replyVideoNote].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [videoNote] to reply with, it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvideonote)
  /// for more information about those options.**
  Future<Message> replyVideoNote(
    dynamic videoNote, {
    bool withQuote = false,
    int? duration,
    int? length,
    dynamic thumb,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendVideoNote(chat.id, videoNote,
          messageThreadId: messageThreadId,
          duration: duration,
          length: length,
          thumb: thumb,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
  }) =>
      _teledart.sendMediaGroup(chat.id, media,
          messageThreadId: messageThreadId,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply);

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
    bool withQuote = false,
    double? horizontalAccuracy,
    int? livePeriod,
    int? heading,
    int? proximityAlertRadius,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendLocation(chat.id, latitude, longitude,
          messageThreadId: messageThreadId,
          horizontalAccuracy: horizontalAccuracy,
          livePeriod: livePeriod,
          heading: heading,
          proximityAlertRadius: proximityAlertRadius,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    String? foursquareId,
    String? foursquareType,
    String? googlePlaceId,
    String? googlePlaceType,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendVenue(chat.id, latitude, longitude, title, address,
          messageThreadId: messageThreadId,
          foursquareId: foursquareId,
          foursquareType: foursquareType,
          googlePlaceId: googlePlaceId,
          googlePlaceType: googlePlaceType,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Reply to the recieved message with a location
  ///
  /// A wrapper around [TeleDart.replyContact].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [phoneNumber] and a [firstName], it can
  /// also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendcontact)
  /// for more information about those options.**
  Future<Message> replyContact(
    String phoneNumber,
    String firstName, {
    bool withQuote = false,
    String? lastName,
    String? vcard,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendContact(chat.id, phoneNumber, firstName,
          messageThreadId: messageThreadId,
          lastName: lastName,
          vcard: vcard,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    List<String> options,
    bool withQuote = false,
    bool? isAnonymous,
    String? type,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
    String? explanation,
    String? explanationParseMode,
    List<MessageEntity>? explanationEntities,
    int? openPeriod,
    int? closeDate,
    bool? isClosed,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendPoll(chat.id, question, options,
          messageThreadId: messageThreadId,
          isAnonymous: isAnonymous,
          type: type,
          allowsMultipleAnswers: allowsMultipleAnswers,
          correctOptionId: correctOptionId,
          explanation: explanation,
          explanationParseMode: explanationParseMode,
          explanationEntities: explanationEntities,
          openPeriod: openPeriod,
          closeDate: closeDate,
          isClosed: isClosed,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    int? messageThreadId,
    bool withQuote = false,
    String emoji = Dice.emojiDice,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendDice(chat.id,
          messageThreadId: messageThreadId ?? this.messageThreadId,
          emoji: emoji,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Reply to the recieved message with an invoice
  ///
  /// A wrapper around [TeleDart.replyInvoice].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [title], a [description], a [payload], a [providerToken] and a list of [prices],
  /// it can also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendinvoice)
  /// for more information about those options.**
  Future<Message> replyInvoice(
    String title,
    String description,
    String payload,
    String providerToken,
    String currency,
    List<LabeledPrice> prices, {
    bool withQuote = false,
    int? maxTipAmount,
    List<int>? suggestedTipAmounts,
    String? startParameter,
    String? providerData,
    String? photoUrl,
    int? photoSize,
    int? photoWidth,
    int? photoHeight,
    bool? needName,
    bool? needPhoneNumber,
    bool? needEmail,
    bool? needShippingAddress,
    bool? sendPhoneNumberToProvider,
    bool? sendEmailToProvider,
    bool? isFlexible,
    bool? disableNotification,
    bool? protectContent,
    bool? allowSendingWithoutReply,
    InlineKeyboardMarkup? replyMarkup,
  }) =>
      _teledart.sendInvoice(
          chat.id, title, description, payload, providerToken, currency, prices,
          messageThreadId: messageThreadId,
          maxTipAmount: maxTipAmount,
          suggestedTipAmounts: suggestedTipAmounts,
          startParameter: startParameter,
          providerData: providerData,
          photoUrl: photoUrl,
          photoSize: photoSize,
          photoWidth: photoWidth,
          photoHeight: photoHeight,
          needName: needName,
          needPhoneNumber: needPhoneNumber,
          needEmail: needEmail,
          needShippingAddress: needShippingAddress,
          sendPhoneNumberToProvider: sendPhoneNumberToProvider,
          sendEmailToProvider: sendEmailToProvider,
          isFlexible: isFlexible,
          disableNotification: disableNotification,
          protectContent: protectContent,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Reply to the recieved message with a game
  ///
  /// A wrapper around [TeleDart.replyGame].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [gameShortName], it can also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendgame)
  /// for more information about those options.**
  Future<Message> replyGame(
    String gameShortName, {
    bool withQuote = false,
    bool? disableNotification,
    bool? protectContent,
    bool? allowSendingWithoutReply,
    InlineKeyboardMarkup? replyMarkup,
  }) =>
      _teledart.sendGame(chat.id, gameShortName,
          messageThreadId: messageThreadId,
          disableNotification: disableNotification,
          protectContent: protectContent,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

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
    bool withQuote = false,
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.sendSticker(chat.id, sticker,
          messageThreadId: messageThreadId,
          disableNotification: disableNotification,
          replyToMessageId: withQuote ? messageId : null,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Copy the recieved message to a channel or chat.
  ///
  /// A wrapper around [TeleDart.copyMessage].
  /// On success, returns the sent [MessageId].
  ///
  /// Apart from a [chatId] to copy the message to, it can
  /// also take some options that control the message
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#copymessage)
  /// for more information about those options.**
  Future<MessageId> copyTo(
    int chatId, {
    int? messageThreadId,
    int? replyToMessageId,
    String? caption,
    String? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableNotification,
    bool? protectContent,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) =>
      _teledart.copyMessage(chatId, chat.id, messageId,
          messageThreadId: messageThreadId,
          caption: caption,
          parseMode: parseMode,
          captionEntities: captionEntities,
          disableNotification: disableNotification,
          protectContent: protectContent,
          replyToMessageId: replyToMessageId,
          allowSendingWithoutReply: allowSendingWithoutReply,
          replyMarkup: replyMarkup);

  /// Forward the recieved message to a channel or chat.
  ///
  /// A wrapper around [TeleDart.forwardMessage].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [chatId] to forward the message to, it can
  /// also take some options that control the message
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#forwardmessage)
  /// for more information about those options.**
  Future<Message> forwardTo(
    int chatId, {
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
  }) =>
      _teledart.forwardMessage(chatId, chat.id, messageId,
          messageThreadId: messageThreadId,
          disableNotification: disableNotification,
          protectContent: protectContent);
}
