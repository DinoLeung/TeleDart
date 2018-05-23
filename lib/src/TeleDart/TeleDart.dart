import 'dart:async';
import 'dart:io' as io;

import 'package:TeleDart/src/TeleDart/Event/Event.dart';
import 'package:TeleDart/src/TeleDart/UpdateMethod/LongPolling.dart';
import 'package:TeleDart/src/TeleDart/UpdateMethod/Webhook.dart';
import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class TeleDart extends Event{
  Telegram telegram;

  LongPolling _longPolling;
  Webhook _webhook;

  final MAX_TIMEOUT = 50;

  TeleDart(Telegram tg) : super(){
    telegram = tg;
  }

  Future _initBotInfo() async{
    await telegram.getMe()
        .then((user) => super.me = user)
        .then((_) => print('${me.username} is initialised'))
        .catchError((exception) =>
          throw new TeleDartException(exception.toString()));
  }

  Future getUpdates(bool useWebhook,
      {String url, io.File certificate, int max_connections: 40,
        int offset: 0, int limit: 100, int timeout: 30,
        List<String> allowed_updates}) async{
    // initialise bot info before getting updates
    _initBotInfo().then((_) {
      if(useWebhook){
        // TODO: get updates with webhook
        _webhook = new Webhook(telegram, url)
            ..certificate = certificate
            ..max_connections = max_connections
            ..allowed_updates = allowed_updates;
        _webhook.setWebhook().catchError((error) =>
            throw new TeleDartException(error.toString()));
        _webhook.startWebhook();
      }
      else {
        _longPolling = new LongPolling(telegram)
            ..offset = offset
            ..limit = limit
            ..timeout = timeout
            ..allowed_updates = allowed_updates;
        _longPolling.startPolling();
        _longPolling.onUpdate().listen((update) => updatesHandler(update));
      }
    })
    .catchError(((exception) =>
      throw new TeleDartException(exception.toString())));
  }

  // add updates to events queue
  void updatesHandler(Update update){
    if(update == null)
      throw new TeleDartException('Update cannot not be null');
    else if(update.message != null)
      this.emitMessage(update.message);
    else if(update.edited_message != null)
      this.emitEditedMessage(update.edited_message);
    else if(update.channel_post != null)
      this.emitChannelPost(update.channel_post);
    else if(update.edited_channel_post != null)
      this.emitEditedChannelPost(update.edited_channel_post);
    else if(update.inline_query != null)
      this.emitInlineQuery(update.inline_query);
    else if(update.chosen_inline_result != null)
      this.emitChosenInlineQuery(update.chosen_inline_result);
    else if(update.callback_query != null)
      this.emitCallbackQuery(update.callback_query);
    else if(update.pre_checkout_query != null)
      this.emitPreCheckoutQuery(update.pre_checkout_query);
    else
      throw new TeleDartException('Object in Update cannot be null');
  }

  Future<Message> reply(Message msgToReply, String reply, [bool withQuote]) async {
    if(withQuote != null && withQuote)
      return telegram.sendMessage(msgToReply.chat.id, reply, reply_to_message_id: msgToReply.message_id);
    else
      return telegram.sendMessage(msgToReply.chat.id, reply);
  }

}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
  String toString() => 'TeleDartException: ${cause}';
}