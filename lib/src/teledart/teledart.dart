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

class TeleDart {
  final Telegram telegram;
  final Event _event;

  AbstractUpdateFetcher fetcher;

  /// Constructor in dependency injection manner
  TeleDart(this.telegram, this._event, {this.fetcher});

  /// Private method to get bot info
  Future<User> _initBotInfo() async => telegram.getMe().then((user) {
        _event.me = user;
        return user;
      });

  /// Starts listening to messages
  ///
  /// Uses long polling by default.
  ///
  /// To configure long polling, inject a [LongPolling] object as [fetcher] when
  /// instantiating [Teledart].
  /// To use webhooks, inject a [Webhook] object as [fetcher] when instantiating
  /// [Teledart].
  Future<User> start() async => await _initBotInfo().then((me) {
        fetcher ??= LongPolling(telegram)
          ..start()
          ..onUpdate().listen((_updatesHandler));
        return me;
      });

  /// Stops fetching updates
  void stop() => fetcher?.stop();

  /// Configures a webhook used by this bot to receive updates.
  ///
  /// For a default webhook managed by this library, you can use a [Webhook].
  /// Alternatively, you can manage webhooks yourself by extending it.
  ///
  /// See: https://core.telegram.org/bots/api#setwebhook
  Future<void> setWebhook() => fetcher != null && fetcher is Webhook
      ? (fetcher as Webhook).setWebhook()
      : throw TeleDartException(
          'Injected update fetcher is type of ${fetcher.runtimeType.toString()} instead of Webhook.');

  /// Removes and stops webhook
  Future<void> removeWebhook() async {
    await telegram.deleteWebhook();
    if (fetcher is Webhook) {
      await fetcher.stop();
      fetcher = null;
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

  /// Listens to message events with [entityType] and [keyword] in text and caption
  ///
  /// [entityType] include `mention` (@username), `hashtag` (#hashtag), `cashtag`($USD),
  /// `bot_command` (/start@jobs_bot), `url` (https://telegram.org),
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
  ///  ```
  ///  onMessage(entityType: 'bot_command', keyword: 'start').listen((message) =>
  ///    teledart.telegram.sendMessage(message.chat.id, 'hello world!'));
  ///  ```
  Stream<TeleDartMessage> onMessage({String entityType, dynamic keyword}) =>
      _event
          .onMessage(entityType: entityType, keyword: keyword)
          .map(_messageStreamMapper);

  /// Listens to edited message events
  Stream<TeleDartMessage> onEditedMessage() =>
      _event.onEditedMessage().map(_messageStreamMapper);

  /// Listens to channel post events
  Stream<TeleDartMessage> onChannelPost() =>
      _event.onChannelPost().map(_messageStreamMapper);

  /// Listens to edited channel post events
  Stream<TeleDartMessage> onEditedChannelPost() =>
      _event.onEditedChannelPost().map(_messageStreamMapper);

  /// Listens to inline query events
  Stream<TeleDartInlineQuery> onInlineQuery() => _event
      .onInlineQuery()
      .map((inlineQuery) => TeleDartInlineQuery(this, inlineQuery));

  /// Listens to chosen inline query events
  Stream<ChosenInlineResult> onChosenInlineResult() =>
      _event.onChosenInlineResult();

  /// Listens to callback query events
  Stream<TeleDartCallbackQuery> onCallbackQuery() => _event
      .onCallbackQuery()
      .map((callbackQuery) => TeleDartCallbackQuery(this, callbackQuery));

  /// Listens to shipping query events
  Stream<TeleDartShippingQuery> onShippingQuery() => _event
      .onShippingQuery()
      .map((shippingQuery) => TeleDartShippingQuery(this, shippingQuery));

  /// Listens to pre checkout query events
  Stream<TeleDartPreCheckoutQuery> onPreCheckoutQuery() =>
      _event.onPreCheckoutQuery().map((preCheckoutQuery) =>
          TeleDartPreCheckoutQuery(this, preCheckoutQuery));

  /// Listens to poll events
  Stream<Poll> onPoll() => _event.onPoll();

  /// Listen to poll answer events
  Stream<PollAnswer> onPollAnswer() => _event.onPollAnswer();

  /// Listen to my chat member events
  Stream<ChatMemberUpdated> onMyChatMember() => _event.onMyChatMember();

  /// Listen to chat member events
  Stream<ChatMemberUpdated> onChatMember() => _event.onChatMember();

  // Short-cuts revolution

  /// Short-cut for onMessage handling entityType `mention` (@username)
  Stream<TeleDartMessage> onMention([dynamic keyword]) =>
      onMessage(entityType: 'mention', keyword: keyword);

  /// Short-cut for onMessage handling entityType `cashtag`
  Stream<TeleDartMessage> onCashtag([dynamic keyword]) =>
      onMessage(entityType: 'cashtag', keyword: keyword);

  /// Short-cut for onMessage handling entityType `hashtag`
  Stream<TeleDartMessage> onHashtag([dynamic keyword]) =>
      onMessage(entityType: 'hashtag', keyword: keyword);

  /// Short-cut for onMessage handling entityType `bot_command`
  Stream<TeleDartMessage> onCommand([dynamic keyword]) =>
      onMessage(entityType: 'bot_command', keyword: keyword);

  /// Short-cut for onMessage handling entityType `url`
  Stream<TeleDartMessage> onUrl([dynamic keyword]) =>
      onMessage(entityType: 'url', keyword: keyword);

  /// Short-cut for onMessage handling entityType `email`
  Stream<TeleDartMessage> onEmail([dynamic keyword]) =>
      onMessage(entityType: 'email', keyword: keyword);

  /// Short-cut for onMessage handling entityType `phone_number`
  Stream<TeleDartMessage> onPhoneNumber([dynamic keyword]) =>
      onMessage(entityType: 'phone_number', keyword: keyword);

  /// Short-cut for onMessage handling entityType `bold`
  Stream<TeleDartMessage> onBold([dynamic keyword]) =>
      onMessage(entityType: 'bold', keyword: keyword);

  /// Short-cut for onMessage handling entityType `italic`
  Stream<TeleDartMessage> onItalic([dynamic keyword]) =>
      onMessage(entityType: 'italic', keyword: keyword);

  /// Short-cut for onMessage handling entityType `code`
  Stream<TeleDartMessage> onCode([dynamic keyword]) =>
      onMessage(entityType: 'code', keyword: keyword);

  /// Short-cut for onMessage handling entityType `pre`
  Stream<TeleDartMessage> onPre([dynamic keyword]) =>
      onMessage(entityType: 'pre', keyword: keyword);

  /// Short-cut for onMessage handling entityType `text_link`
  Stream<TeleDartMessage> onTextLink([dynamic keyword]) =>
      onMessage(entityType: 'text_link', keyword: keyword);

  /// Short-cut for onMessage handling entityType `text_mention`
  Stream<TeleDartMessage> onTextMention([dynamic keyword]) =>
      onMessage(entityType: 'text_mention', keyword: keyword);

  /// Short-cut to reply with a text message
  Future<Message> replyMessage(Message orgMsg, String text,
          {bool withQuote = false,
          String parse_mode,
          List<MessageEntity> entities,
          bool disable_web_page_preview,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendMessage(orgMsg.chat.id, text,
          parse_mode: parse_mode,
          entities: entities,
          disable_web_page_preview: disable_web_page_preview,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a photo message
  Future<Message> replyPhoto(Message orgMsg, dynamic photo,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendPhoto(orgMsg.chat.id, photo,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a audio message
  Future<Message> replyAudio(Message orgMsg, dynamic audio,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          int duration,
          String performer,
          String title,
          dynamic thumb,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
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

  /// Short-cut to reply with a document message
  Future<Message> replyDocument(Message orgMsg, dynamic document,
          {bool withQuote = false,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendDocument(orgMsg.chat.id, document,
          thumb: thumb,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a video message
  Future<Message> replyVideo(Message orgMsg, dynamic video,
          {bool withQuote = false,
          int duration,
          int width,
          int height,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool supports_streaming,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
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

  /// Short-cut to reply with a animation message
  Future<Message> replyAnimation(Message orgMsg, dynamic animation,
          {bool withQuote = false,
          int duration,
          int width,
          int height,
          dynamic thumb,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
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

  /// Short-cut to reply with a voice message
  Future<Message> replyVoice(Message orgMsg, dynamic voice,
          {bool withQuote = false,
          String caption,
          String parse_mode,
          List<MessageEntity> caption_entities,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendVoice(orgMsg.chat.id, voice,
          caption: caption,
          parse_mode: parse_mode,
          caption_entities: caption_entities,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a video note message
  Future<Message> replyVideoNote(Message orgMsg, dynamic video_note,
          {bool withQuote = false,
          int duration,
          int length,
          dynamic thumb,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendVideoNote(orgMsg.chat.id, video_note,
          duration: duration,
          length: length,
          thumb: thumb,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a media group message
  Future<List<Message>> replyMediaGroup(Message orgMsg, List<InputMedia> media,
          {bool withQuote = false,
          bool disable_notification,
          bool allow_sending_without_reply}) =>
      telegram.sendMediaGroup(orgMsg.chat.id, media,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply);

  /// Short-cut to reply with a location message
  Future<Message> replyLocation(
          Message orgMsg, double latitude, double longitude,
          {bool withQuote = false,
          double horizontal_accuracy,
          int live_period,
          int heading,
          int proximity_alert_radius,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendLocation(orgMsg.chat.id, latitude, longitude,
          horizontal_accuracy: horizontal_accuracy,
          live_period: live_period,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to edit a live location message
  Future<Message> editLiveLocation(double latitude, double longitude,
          {dynamic chat_id,
          int message_id,
          String inline_message_id,
          double horizontal_accuracy,
          int heading,
          int proximity_alert_radius,
          ReplyMarkup reply_markup}) =>
      telegram.editMessageLiveLocation(latitude, longitude,
          chat_id: chat_id,
          message_id: message_id,
          inline_message_id: inline_message_id,
          horizontal_accuracy: horizontal_accuracy,
          heading: heading,
          proximity_alert_radius: proximity_alert_radius,
          reply_markup: reply_markup);

  /// Short-cut to stop a live location message
  Future<Message> stopLiveLocation(
          {dynamic chat_id,
          int message_id,
          String inline_message_id,
          ReplyMarkup reply_markup}) =>
      telegram.stopMessageLiveLocation(
          chat_id: chat_id,
          message_id: message_id,
          inline_message_id: inline_message_id,
          reply_markup: reply_markup);

  /// Short-cut to reply with a venue message
  Future<Message> replyVenue(Message orgMsg, double latitude, double longitude,
          String title, String address,
          {bool withQuote = false,
          String foursquare_id,
          String foursquare_type,
          String google_place_id,
          String google_place_type,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendVenue(orgMsg.chat.id, latitude, longitude, title, address,
          foursquare_id: foursquare_id,
          foursquare_type: foursquare_type,
          google_place_id: google_place_id,
          google_place_type: google_place_type,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a contact message
  Future<Message> replyContact(
          Message orgMsg, String phone_number, String first_name,
          {bool withQuote = false,
          String last_name,
          String vcard,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendContact(orgMsg.chat.id, phone_number, first_name,
          last_name: last_name,
          vcard: vcard,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to reply with a poll message
  Future<Message> replyPoll(
          Message orgMsg, String question, List<String> options,
          {bool withQuote = false,
          bool is_anonymous,
          String type,
          bool allows_multiple_answers,
          int correct_option_id,
          String explanation,
          String explanation_parse_mode,
          List<MessageEntity> explanation_entities,
          int open_period,
          int close_date,
          bool is_closed,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
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

  /// Short-cut to reply with a dice message
  Future<Message> replyDice(Message orgMsg,
          {bool withQuote = false,
          String emoji = Dice.DICE,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendDice(orgMsg.chat.id,
          emoji: emoji,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  // TODO: order of this block is not matching with telegram.TeleDart
  // ! just put it here for now for the sake of providing functionality
  /// Short-cut to reply with a contact message
  Future<Message> replySticker(Message orgMsg, dynamic sticker,
          {bool withQuote = false,
          bool disable_notification,
          bool allow_sending_without_reply,
          ReplyMarkup reply_markup}) =>
      telegram.sendSticker(orgMsg.chat.id, sticker,
          disable_notification: disable_notification,
          reply_to_message_id: withQuote ? orgMsg.message_id : null,
          allow_sending_without_reply: allow_sending_without_reply,
          reply_markup: reply_markup);

  /// Short-cut to answer inline query
  Future<bool> answerInlineQuery(
          InlineQuery inline_query, List<InlineQueryResult> results,
          {int cache_time,
          bool is_personal,
          String next_offset,
          String switch_pm_text,
          String switch_pm_parameter}) =>
      telegram.answerInlineQuery(inline_query.id, results,
          cache_time: cache_time,
          is_personal: is_personal,
          next_offset: next_offset,
          switch_pm_text: switch_pm_text,
          switch_pm_parameter: switch_pm_parameter);

  /// Short-cut to answer callback query
  Future<bool> answerCallbackQuery(CallbackQuery callback_query,
          {String text, bool show_alert, String url, int cache_time}) =>
      telegram.answerCallbackQuery(callback_query.id,
          text: text, show_alert: show_alert, url: url, cache_time: cache_time);

  /// Short-cut to answer shipping query
  Future<bool> answerShippingQuery(ShippingQuery shipping_query, bool ok,
          {List<ShippingOption> shipping_options, String error_message}) =>
      telegram.answerShippingQuery(shipping_query.id, ok,
          shipping_options: shipping_options, error_message: error_message);

  /// Short-cut to answer pre-checkout query
  Future<bool> answerPreCheckoutQuery(
          PreCheckoutQuery pre_checkout_query, bool ok,
          {String error_message}) =>
      telegram.answerPreCheckoutQuery(pre_checkout_query.id, ok,
          error_message: error_message);
}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
  @override
  String toString() => 'TeleDartException: $cause';
}
