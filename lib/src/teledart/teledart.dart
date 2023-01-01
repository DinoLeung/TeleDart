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
class TeleDart extends Telegram {
  final Event _event;

  AbstractUpdateFetcher fetcher;

  /// Constructor in dependency injection manner
  TeleDart(String token, this._event, {AbstractUpdateFetcher? fetcher})
      : fetcher = fetcher ?? LongPolling(Telegram(token)),
        super(token);

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
  ///     Telegram(envVars['BOT_TOKEN']!),
  ///     envVars['HOST_URL']!,
  ///     envVars['BOT_TOKEN']!,
  ///     io.File(envVars['CERT_PATH']!),
  ///     io.File(envVars['KEY_PATH']!),
  ///     port: int.parse(envVars['BOT_PORT']!));
  /// var teledart = TeleDart(envVars['BOT_TOKEN']!, event, fetcher: webhook);
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
  Future<void> configureWebhook() => fetcher is Webhook
      ? (fetcher as Webhook).setWebhook()
      : throw TeleDartException(
          'Injected update fetcher is type of ${fetcher.runtimeType.toString()} instead of Webhook.');

  /// Remove and stops webhook
  Future<void> removeWebhook() async {
    await super.deleteWebhook();
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

  // Short-cuts for onMessage

  /// Short-cut for [onMessage] handling entityType `mention` (@username)
  Stream<TeleDartMessage> onMention([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeMention, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `cashtag`
  Stream<TeleDartMessage> onCashtag([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeCashtag, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `hashtag`
  Stream<TeleDartMessage> onHashtag([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeHashtag, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `bot_command`
  Stream<TeleDartMessage> onCommand([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeBotCommand, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `url`
  Stream<TeleDartMessage> onUrl([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeUrl, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `email`
  Stream<TeleDartMessage> onEmail([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeEmail, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `phone_number`
  Stream<TeleDartMessage> onPhoneNumber([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typePhoneNmber, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `bold`
  Stream<TeleDartMessage> onBold([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeBold, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `italic`
  Stream<TeleDartMessage> onItalic([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeItalic, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `spoiler`
  Stream<TeleDartMessage> onSpoiler([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeSpolier, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `code`
  Stream<TeleDartMessage> onCode([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeCode, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `pre`
  Stream<TeleDartMessage> onPre([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typePre, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `text_link`
  Stream<TeleDartMessage> onTextLink([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeTextLink, keyword: keyword);

  /// Short-cut for [onMessage] handling entityType `text_mention`
  Stream<TeleDartMessage> onTextMention([dynamic keyword]) =>
      onMessage(entityType: MessageEntity.typeTextMention, keyword: keyword);
}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
  @override
  String toString() => 'TeleDartException: $cause';
}
