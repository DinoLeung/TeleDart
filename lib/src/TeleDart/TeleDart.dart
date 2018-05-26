import 'dart:async';
import 'dart:io' as io;

import 'Event/Event.dart';
import 'Fetch/LongPolling.dart';
import 'Fetch/Webhook.dart';
import '../Telegram/Telegram.dart';
import '../Telegram/Model.dart';

class TeleDart{

  Telegram telegram;
  Event _event;

  LongPolling _longPolling;
  Webhook _webhook;

  final int MAX_TIMEOUT = 50;

  /// Constructor in dependency injection manner
  TeleDart(Telegram telegram, Event event){
    this.telegram = telegram;
    this._event = event;
  }

  /// Private method to get bot info
  Future _initBotInfo() async{
    await telegram.getMe()
        .then((user) => _event.me = user)
        .then((_) => print('${_event.me.username} is initialised'))
        .catchError((exception) =>
          throw new TeleDartException(exception.toString()));
  }

  /// Starts listening to messages
  ///
  /// Use long polling by default.
  ///
  /// Setup desired configurations using [setupLongPolling] or [setupWebhook]
  ///
  /// Throws [TeleDartException]
  Future getUpdates({bool webhook: false}) async{
    // initialise bot info before getting updates
    _initBotInfo().then((_) {
      if(webhook){
        if(_webhook == null)
          throw new TeleDartException('Webhook has not been set up yet');
        else {
          _webhook.startWebhook();
          _webhook.onUpdate().listen((update) => _updatesHandler(update));
        }
      }
      else {
        _longPolling ??= new LongPolling(telegram);
        _longPolling.startPolling();
        _longPolling.onUpdate().listen((update) => _updatesHandler(update));
      }
    })
    .catchError(((exception) =>
      throw new TeleDartException(exception.toString())));
  }

  /// Configures long polling method
  ///
  /// See: [https://core.telegram.org/bots/api#getupdates](https://core.telegram.org/bots/api#getupdates)
  void setupLongPolling({int offset: 0, int limit: 100, int timeout: 30,
    List<String> allowed_updates}) {
    _longPolling = new LongPolling(telegram)
        ..offset = offset
        ..limit = limit
        ..timeout = timeout
        ..allowed_updates = allowed_updates;
  }

  /// Removes and stops long polling
  void removeLongPolling() {
    if(_longPolling != null)
      _longPolling = null;
  }

  /// Configures webhook method
  ///
  /// Default [port] is `443`, Telegram API supports `443`, `80`, `88`, `8443`.
  /// Provide [privateKey] and [certificate] pair for HTTPS configuration
  ///
  /// See: [https://core.telegram.org/bots/api#setwebhook](https://core.telegram.org/bots/api#setwebhook)
  Future setupWebhook(String url, String secretPath,
      {int port: 443, io.File privateKey, io.File certificate,
        int max_connections: 40, List<String> allowed_updates}) async {

    _webhook = new Webhook(telegram, url, secretPath)
        ..port = port
        ..privateKey = privateKey
        ..certificate = certificate
        ..max_connections = max_connections
        ..allowed_updates = allowed_updates;

    return _webhook.setWebhook();
  }

  /// Removes and stops webhook
  void removeWebhook() {
    if(_webhook != null)
      _webhook.deleteWebhook()
          .then((_) {
            _webhook.stopWebhook();
            _webhook = null;
      });
  }

  // Private method to add updates into events queue
  void _updatesHandler(Update update){
    if(update == null)
      throw new TeleDartException('Update cannot not be null');
    else if(update.message != null)
      _event.emitMessage(update.message);
    else if(update.edited_message != null)
      _event.emitEditedMessage(update.edited_message);
    else if(update.channel_post != null)
      _event.emitChannelPost(update.channel_post);
    else if(update.edited_channel_post != null)
      _event.emitEditedChannelPost(update.edited_channel_post);
    else if(update.inline_query != null)
      _event.emitInlineQuery(update.inline_query);
    else if(update.chosen_inline_result != null)
      _event.emitChosenInlineQuery(update.chosen_inline_result);
    else if(update.callback_query != null)
      _event.emitCallbackQuery(update.callback_query);
    else if(update.pre_checkout_query != null)
      _event.emitPreCheckoutQuery(update.pre_checkout_query);
    else
      throw new TeleDartException('Object in Update cannot be null');
  }

  /// Listens to message events with [entityType] and [keyword] in text and caption
  ///
  /// entityType include `mention` (@username), `hashtag`, `bot_command`, `url`,
  /// `email`, `bold` (bold text), `italic` (italic text), `code` (monowidth string),
  /// `pre` (monowidth block), `text_link` (for clickable text URLs), `text_mention`
  /// (for users without usernames)
  ///
  /// **Normal message has NO [entityType]**
  ///
  /// To listen to `/start`
  ///  ```
  ///  onMessage(entityType: 'bot_command', keyword: 'start').listen((message) {
  ///    teledart.telegram.sendMessage(message.from.id, 'hello world!');
  ///  });
  ///  ```
  ///
  Stream<Message> onMessage({String entityType, String keyword}) =>
      _event.onMessage(entityType: entityType, keyword: keyword);

  /// Listens to edited message events
  Stream<Message> onEditedMessage() => _event.onEditedMessage();

  /// Listens to channel post events
  Stream<Message> onChannelPost() => _event.onChannelPost();

  /// Listens to edited channel post events
  Stream<Message> onEditedChannelPost() => _event.onEditedChannelPost();

  /// Listens to inline query events
  Stream<InlineQuery> onInlineQuery() => _event.onInlineQuery();

  /// Listens to chosen inline query events
  Stream<ChosenInlineResult> onChosenInlineQuery() => _event.onChosenInlineQuery();

  /// Listens to callback query events
  Stream<CallbackQuery> onCallbackQuery() => _event.onCallbackQuery();

  /// Listens to shipping query events
  Stream<ShippingQuery> onShippingQuery() => _event.onShippingQuery();

  /// Listens to pre checkout query events
  Stream<PreCheckoutQuery> onPreCheckoutQuery() => _event.onPreCheckoutQuery();

}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
  String toString() => 'TeleDartException: ${cause}';
}