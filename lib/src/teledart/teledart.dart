/*
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

import 'dart:async';

import '../telegram/model.dart';
import '../telegram/telegram.dart';
import 'event/event.dart';
import 'fetch/abstract_update_fetcher.dart';
import 'fetch/long_polling.dart';
import 'fetch/webhook.dart';
import 'model/callback_query.dart';
import 'model/inline_query.dart';
import 'model/message.dart';
import 'model/pre_checkout_query.dart';
import 'model/shipping_query.dart';

/// The main class for controlling your bot.
///
/// It combines the methods from the [Telegram] and the [Event] objects
/// that you pass into it, so that you can conviniently call them
/// as methods of a single object.
///
/// All of the listeners ([onMessage], [onPoll], etc.) return a [Stream].
/// To actually do something when that listener triggers, you need to
/// Use the [Stream.listen] method and pass a function into it. For example:
///
/// ```dart
/// teledart.onMessage().listen((message) => print(message.text));
/// ````
///
/// Where `teledart` is an instance of the [TeleDart] class.
///
/// Here the `message` variable will be an instance of [TeleDartMessage],
/// since the onMessage method returns a [Stream<TeleDartMessage>].
///
/// In case you want to use methods of the [Telegram] class, you can do so
/// by calling them through [TeleDart.telegram]
class TeleDart {
  final Telegram telegram;
  final Event _event;

  AbstractUpdateFetcher fetcher;

  /// Constructor in dependency injection manner
  TeleDart(this.telegram, this._event, {AbstractUpdateFetcher? fetcher})
      : fetcher = fetcher ?? LongPolling(telegram);

  /// Start listening to messages
  ///
  /// Uses long polling by default.
  ///
  /// To configure long polling, inject a [LongPolling] object as [fetcher] when
  /// instantiating [TeleDart].
  /// To use webhooks, inject a [Webhook] object as [fetcher] when instantiating
  /// [TeleDart].
  ///
  /// The webhook injection is done like so:
  /// ```dart
  /// var webhook = await Webhook.createHttpsWebhok(
  ///     telegram,
  ///     envVars['HOST_URL']!,
  ///     envVars['BOT_TOKEN']!,
  ///     io.File(envVars['CERT_PATH']!),
  ///     io.File(envVars['KEY_PATH']!),
  ///     port: int.parse(envVars['BOT_PORT']!));
  /// var teledart = TeleDart(telegram, event, fetcher: webhook);
  /// ```
  void start() {
    fetcher
      ..start()
      ..onUpdate().listen((_updatesHandler));
  }

  /// Stop fetching updates
  void stop() => fetcher.stop();

  /// Configure a webhook used by this bot to receive updates.
  ///
  /// For a default webhook managed by this library, you can use a [Webhook].
  /// Alternatively, you can manage webhooks yourself by extending it.
  ///
  /// See: https://core.telegram.org/bots/api#setwebhook
  Future<void> setWebhook() => fetcher is Webhook
      ? (fetcher as Webhook).setWebhook()
      : throw TeleDartException(
          'Injected update fetcher is type of ${fetcher.runtimeType.toString()} instead of Webhook.');

  /// Remove and stops webhook
  Future<void> removeWebhook() async {
    await telegram.deleteWebhook();
    if (fetcher is Webhook) {
      await fetcher.stop();
    }
  }

  /// Private method to add updates into events queue
  void _updatesHandler(Update update) {
    try {
      _event.emitUpdate(update);
    } on TeleDartEventException catch (e) {
      print(e);
    }
  }

  TeleDartMessage _messageStreamMapper(Message msg) =>
      TeleDartMessage(this, msg);

  /// Listen to message events with [entityType] and [keyword] in text and caption
  ///
  /// [entityType] include `mention` (@username), `hashtag` (#hashtag), `cashtag`($USD),
  /// `bot_command` (/start@jobs_bot), `url` (https://telegram.org/),
  /// `email`(do-not-reply@telegram.org), `phone_number` (+1-212-555-0123), `bold` (bold text),
  /// `italic` (italic text), `underline` (underlined text), `strikethrough` (strikethrough text),
  /// `code` (monowidth string), `pre` (monowidth block), `text_link` (for
  /// clickable text URLs), `text_mention` (for users without usernames)
  ///
  /// Omitting [entityType] or passing null will results listening to messages with no [entityType].
  /// To listen to messages of all [entityType], pass `*` as [entityType].
  ///
  /// **Normal message has NO [entityType]**
  ///
  /// Normal message accepts regular expressions as [keyword]
  ///
  /// To listen to `/start`
  /// ```dart
  /// onMessage(entityType: 'bot_command', keyword: 'start').listen((message) =>
  ///   teledart.telegram.sendMessage(message.chat.id, 'hello world!'));
  /// ```
  Stream<TeleDartMessage> onMessage({String? entityType, dynamic keyword}) =>
      _event
          .onMessage(entityType: entityType, keyword: keyword)
          .map(_messageStreamMapper);

  /// Listen to edited message events
  Stream<TeleDartMessage> onEditedMessage() =>
      _event.onEditedMessage().map(_messageStreamMapper);

  /// Listen to channel post events
  Stream<TeleDartMessage> onChannelPost() =>
      _event.onChannelPost().map(_messageStreamMapper);

  /// Listen to edited channel post events
  Stream<TeleDartMessage> onEditedChannelPost() =>
      _event.onEditedChannelPost().map(_messageStreamMapper);

  /// Listen to inline query events
  ///
  /// Use [TeleDartInlineQuery.answer] to answer to inline queries.
  Stream<TeleDartInlineQuery> onInlineQuery() => _event
      .onInlineQuery()
      .map((inlineQuery) => TeleDartInlineQuery(this, inlineQuery));

  /// Listen to chosen inline query events
  Stream<ChosenInlineResult> onChosenInlineResult() =>
      _event.onChosenInlineResult();

  /// Listen to callback query events
  Stream<TeleDartCallbackQuery> onCallbackQuery() => _event
      .onCallbackQuery()
      .map((callbackQuery) => TeleDartCallbackQuery(this, callbackQuery));

  /// Listen to shipping query events
  Stream<TeleDartShippingQuery> onShippingQuery() => _event
      .onShippingQuery()
      .map((shippingQuery) => TeleDartShippingQuery(this, shippingQuery));

  /// Listen to pre checkout query events
  Stream<TeleDartPreCheckoutQuery> onPreCheckoutQuery() =>
      _event.onPreCheckoutQuery().map((preCheckoutQuery) =>
          TeleDartPreCheckoutQuery(this, preCheckoutQuery));

  /// Listen to poll events
  Stream<Poll> onPoll() => _event.onPoll();

  /// Listen to poll answer events
  Stream<PollAnswer> onPollAnswer() => _event.onPollAnswer();

  /// Listen to my chat member events
  Stream<ChatMemberUpdated> onMyChatMember() => _event.onMyChatMember();

  /// Listen to chat member events
  Stream<ChatMemberUpdated> onChatMember() => _event.onChatMember();

  /// Listen to chat join request events
  Stream<ChatJoinRequest> onChatJoinRequest() => _event.onChatJoinRequest();

  // Short-cuts revolution

  /// Short-cut for [onMessage] handling entityType `mention` (@username)
  Stream<TeleDartMessage> onMention([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.MENTION, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `cashtag`
  Stream<TeleDartMessage> onCashtag([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.CASHTAG, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `hashtag`
  Stream<TeleDartMessage> onHashtag([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.HASHTAG, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `bot_command`
  Stream<TeleDartMessage> onCommand([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.BOT_COMMAND, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `url`
  Stream<TeleDartMessage> onUrl([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.URL, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `email`
  Stream<TeleDartMessage> onEmail([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.EMAIL, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `phone_number`
  Stream<TeleDartMessage> onPhoneNumber([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.PHONE_NUMBER, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `bold`
  Stream<TeleDartMessage> onBold([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.BOLD, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `italic`
  Stream<TeleDartMessage> onItalic([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.ITALIC, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `spoiler`
  Stream<TeleDartMessage> onSpoiler([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.SPOILER, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `code`
  Stream<TeleDartMessage> onCode([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.CODE, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `pre`
  Stream<TeleDartMessage> onPre([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.PRE, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `text_link`
  Stream<TeleDartMessage> onTextLink([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.TEXT_LINK, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `text_mention`
  Stream<TeleDartMessage> onTextMention([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.TEXT_MENTION, keyword: keyword);

  /// Reply to a given message with text
  ///
  /// A wrapper around [Telegram.sendMessage].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [String] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendmessage)
  /// for more information about those options.**
  Future<Message> replyMessage(Message orgMsg, String text,
          {bool withQuote = false,
          String? parse_mode,
          List<MessageEntity>? entities,
          bool? disable_web_page_preview,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendMessage(orgMsg.chat.id, text,
          parse_mode: parse_mode,
          entities: entities,
          disable_web_page_preview: disable_web_page_preview,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with an image
  ///
  /// A wrapper around [Telegram.sendPhoto].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [photo] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendphoto)
  /// for more information about those options.**
  Future<Message> replyPhoto(Message orgMsg, dynamic photo,
          {bool withQuote = false,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendPhoto(orgMsg.chat.id, photo,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with an audio
  ///
  /// A wrapper around [Telegram.sendAudio].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and an [audio] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendaudio)
  /// for more information about those options.**
  Future<Message> replyAudio(Message orgMsg, dynamic audio,
          {bool withQuote = false,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          int? duration,
          String? performer,
          String? title,
          dynamic thumb,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendAudio(orgMsg.chat.id, audio,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          duration: duration,
          performer: performer,
          title: title,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a document
  ///
  /// A wrapper around [Telegram.sendDocument].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [document] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#senddocument)
  /// for more information about those options.**
  Future<Message> replyDocument(Message orgMsg, dynamic document,
          {bool withQuote = false,
          dynamic thumb,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendDocument(orgMsg.chat.id, document,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a video
  ///
  /// A wrapper around [Telegram.sendVideo].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [video] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvideo)
  /// for more information about those options.**
  Future<Message> replyVideo(Message orgMsg, dynamic video,
          {bool withQuote = false,
          int? duration,
          int? width,
          int? height,
          dynamic thumb,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          bool? supports_streaming,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendVideo(orgMsg.chat.id, video,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          supports_streaming: supports_streaming,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with an animation (GIF or H.264/MPEG-4 AVC video without sound)
  ///
  /// A wrapper around [Telegram.sendAnimation].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and an [animation] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendanimation)
  /// for more information about those options.**
  Future<Message> replyAnimation(Message orgMsg, dynamic animation,
          {bool withQuote = false,
          int? duration,
          int? width,
          int? height,
          dynamic thumb,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendAnimation(orgMsg.chat.id, animation,
          duration: duration,
          width: width,
          height: height,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a voice message
  ///
  /// A wrapper around [Telegram.sendVoice].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [voice] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvoice)
  /// for more information about those options.**
  Future<Message> replyVoice(Message orgMsg, dynamic voice,
          {bool withQuote = false,
          String? caption,
          String? parse_mode,
          List<MessageEntity>? caption_entities,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendVoice(orgMsg.chat.id, voice,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a video note
  ///
  /// A wrapper around [Telegram.sendVideoNote].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [video_note] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvideonote)
  /// for more information about those options.**
  Future<Message> replyVideoNote(Message orgMsg, dynamic video_note,
          {bool withQuote = false,
          int? duration,
          int? length,
          dynamic thumb,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendVideoNote(orgMsg.chat.id, video_note,
          duration: duration,
          length: length,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a media group message (multiple media files)
  ///
  /// A wrapper around [Telegram.sendMediaGroup].
  /// On success, returns the sent [Message][Message]
  ///
  /// Apart from a [Message] to reply to and a [List<InputMedia>] to
  /// reply with, it can also take some options that
  /// control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendmediagroup)
  /// for more information about those options.**
  Future<List<Message>> replyMediaGroup(Message orgMsg, List<InputMedia> media,
          {bool withQuote = false,
          bool? disable_notification,
          bool? allow_sending_without_reply}) =>
      telegram.sendMediaGroup(orgMsg.chat.id, media,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply);

  /// Reply to a given message with a location
  ///
  /// A wrapper around [Telegram.sendLocation].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to, a [latitude] and a [longitude],
  /// it can also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendlocation)
  /// for more information about those options.**
  Future<Message> replyLocation(
          Message orgMsg, double latitude, double longitude,
          {bool withQuote = false,
          double? horizontal_accuracy,
          int? live_period,
          int? heading,
          int? proximity_alert_radius,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendLocation(orgMsg.chat.id, latitude, longitude,
          horizontal_accuracy: horizontal_accuracy,
          live_period: live_period,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Edits a sent live location message
  ///
  /// A wrapper around [Telegram.editMessageLiveLocation].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [latitude] and a [longitude], it can also take some options
  /// that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#editmessagelivelocation)
  /// for more information about those options.**
  Future<Message> editLiveLocation(double latitude, double longitude,
          {dynamic chat_id,
          int? message_id,
          String? inline_message_id,
          double? horizontal_accuracy,
          int? heading,
          int? proximity_alert_radius,
          ReplyMarkup? reply_markup}) =>
      telegram.editMessageLiveLocation(latitude, longitude,
          chat_id: chat_id,
          message_id: message_id,
          inline_message_id: inline_message_id,
          horizontal_accuracy: horizontal_accuracy,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          reply_markup: reply_markup);

  /// Stops a sent live location message
  ///
  /// A wrapper around [Telegram.stopMessageLiveLocation].
  /// On success, returns the sent [Message].
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#editmessagelivelocation)
  /// for more information about the accepted options.**
  Future<Message> stopLiveLocation(
          {dynamic chat_id,
          int? message_id,
          String? inline_message_id,
          ReplyMarkup? reply_markup}) =>
      telegram.stopMessageLiveLocation(
          chat_id: chat_id,
          message_id: message_id,
          inline_message_id: inline_message_id,
          reply_markup: reply_markup);

  /// Reply to a given message with a venue message
  ///
  /// A wrapper around [Telegram.sendVenue].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to, a [latitude], a [longitude],
  /// a [title] and an [address], it can also take some options that control the
  /// message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendvenue)
  /// for more information about those options.**
  Future<Message> replyVenue(Message orgMsg, double latitude, double longitude,
          String title, String address,
          {bool withQuote = false,
          String? foursquare_id,
          String? foursquare_type,
          String? google_place_id,
          String? google_place_type,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendVenue(orgMsg.chat.id, latitude, longitude, title, address,
          foursquare_id: foursquare_id,
          foursquare_type: foursquare_type,
          google_place_id: google_place_id,
          google_place_type: google_place_type,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a contact
  ///
  /// A wrapper around [Telegram.sendContact].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to, a [phone_number] and
  /// a [first_name], it can also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendcontact)
  /// for more information about those options.**
  Future<Message> replyContact(
          Message orgMsg, String phone_number, String first_name,
          {bool withQuote = false,
          String? last_name,
          String? vcard,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendContact(orgMsg.chat.id, phone_number, first_name,
          last_name: last_name,
          vcard: vcard,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a poll
  ///
  /// A wrapper around [Telegram.sendPoll].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to, a [question] and
  /// a [List<String>] of [options], it can also take some options that control the message
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendpoll)
  /// for more information about those options.**
  Future<Message> replyPoll(
          Message orgMsg, String question, List<String> options,
          {bool withQuote = false,
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
          ReplyMarkup? reply_markup}) =>
      telegram.sendPoll(orgMsg.chat.id, question, options,
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
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Reply to a given message with a dice message
  ///
  /// A wrapper around [Telegram.sendDice].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to, it can
  /// also take some options that control the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#senddice)
  /// for more information about those options.**
  Future<Message> replyDice(Message orgMsg,
          {bool withQuote = false,
          String emoji = Dice.DICE,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendDice(orgMsg.chat.id,
          emoji: emoji,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  // TODO: order of this block is not matching with telegram.TeleDart
  // ! just put it here for now for the sake of providing functionality
  /// Reply to a given message with a sticker
  ///
  /// A wrapper around [Telegram.sendSticker].
  /// On success, returns the sent [Message].
  ///
  /// Apart from a [Message] to reply to and a [sticker]
  /// to reply with, it can also take some options that control
  /// the message appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#sendsticker)
  /// for more information about those options.**
  Future<Message> replySticker(Message orgMsg, dynamic sticker,
          {bool withQuote = false,
          bool? disable_notification,
          bool? allow_sending_without_reply,
          ReplyMarkup? reply_markup}) =>
      telegram.sendSticker(orgMsg.chat.id, sticker,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to answer an inline query
  ///
  /// A wrapper around [Telegram.answerInlineQuery].
  /// On success, returns true.
  ///
  /// Apart from a [InlineQuery] to answer and a [List<InlineQueryResult>]
  /// of results, it can also take some options that control the inline dialog
  /// appearance and behavior.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answerinlinequery)
  /// for more information about those options.**
  Future<bool> answerInlineQuery(
          InlineQuery inline_query, List<InlineQueryResult> results,
          {int? cache_time,
          bool? is_personal,
          String? next_offset,
          String? switch_pm_text,
          String? switch_pm_parameter}) =>
      telegram.answerInlineQuery(inline_query.id, results,
          cache_time: cache_time,
          is_personal: is_personal,
          next_offset: next_offset,
          switch_pm_text: switch_pm_text,
          switch_pm_parameter: switch_pm_parameter);

  /// Short-cut to answer a callback query
  ///
  /// A wrapper around [Telegram.answerCallbackQuery].
  /// On success, returns true.
  ///
  /// Apart from a [CallbackQuery] to answer, it can also
  /// take some options that control the callback query answer.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answercallbackquery)
  /// for more information about those options.**
  Future<bool> answerCallbackQuery(CallbackQuery callback_query,
          {String? text, bool? show_alert, String? url, int? cache_time}) =>
      telegram.answerCallbackQuery(callback_query.id,
          text: text, show_alert: show_alert, url: url, cache_time: cache_time);

  /// Short-cut to answer a shipping query
  ///
  /// A wrapper around [Telegram.answerShippingQuery].
  /// On success, returns true.
  ///
  /// Apart from a [ShippingQuery] to answer and a [bool] that indicates
  /// if the shipping is possible, it can also take some options that
  /// control the shipping.
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answershippingquery)
  /// for more information about those options.**
  Future<bool> answerShippingQuery(ShippingQuery shipping_query, bool ok,
          {List<ShippingOption>? shipping_options, String? error_message}) =>
      telegram.answerShippingQuery(shipping_query.id, ok,
          shipping_options: shipping_options, error_message: error_message);

  /// Short-cut to answer a pre-checkout query
  ///
  /// A wrapper around [Telegram.answerPreCheckoutQuery].
  /// On success, returns true.
  ///
  /// It can take a [PreCheckoutQuery] to answer and a [bool] that indicates
  /// if the pre-checkout is possible, and an [error_message] that
  /// is shown to user if [ok] is false (You don't have to specify it if [ok] is true).
  ///
  /// **Check [Telegram API documentation](https://core.telegram.org/bots/api#answerprecheckoutquery)
  /// for more information about those options.**
  Future<bool> answerPreCheckoutQuery(
          PreCheckoutQuery pre_checkout_query, bool ok,
          {String? error_message}) =>
      telegram.answerPreCheckoutQuery(pre_checkout_query.id, ok,
          error_message: error_message);
}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
  @override
  String toString() => 'TeleDartException: $cause';
}
