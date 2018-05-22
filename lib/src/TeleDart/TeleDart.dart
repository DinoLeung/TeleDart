import 'dart:async';
import 'dart:io';
import 'package:TeleDart/src/TeleDart/Event.dart';
import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class TeleDart extends Event{
  Telegram telegram;

  bool _webhook = false;

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

  Future getUpdates() async{
    // initialise bot info before getting updates
    _initBotInfo().then((_) {
      if(_webhook){
        // TODO: get updates with webhook
      }
      else {
        startPolling();
      }
    });
  }

  void startPolling({int offset: 0, int limit: 100, timeout: 30,
      List<String> allowed_updates}) {

    if(_webhook)
      throw new TeleDartException('Webhook is enabled.');
    if(timeout > MAX_TIMEOUT)
      throw new TeleDartException('Timeout may not greater than ${MAX_TIMEOUT}.');

    telegram.getUpdates(offset: offset, limit: limit,
        timeout: timeout, allowed_updates: allowed_updates)
        .then((updates) {
          if(updates.length > 0){
            for (Update update in updates) {
              updatesHandler(update);
              offset = update.update_id + 1;
            }
          }
          startPolling(offset: offset, limit: limit,
              timeout: timeout, allowed_updates: allowed_updates);
        })
        .catchError((error) {
          // TODO: find out what exceptions can be ignored
          print(error.toString());
          if(error is HandshakeException)
            startPolling(offset: offset, limit: limit,
                timeout: timeout, allowed_updates: allowed_updates);
          else
            throw new TeleDartException(error.toString());
        });
  }

  // add updates to events queue
  void updatesHandler(Update update){
    if(update.message != null){
      // bot commands
//      if(update.message.entityOf('bot_command') != null){
//        this.emitCommand(update.message);
//        print('done emitting');
//      }
//      else
      this.emitMessage(update.message);
    }
    else if(update.edited_message != null){
      this.emitEditedMessage(update.edited_message);
    }
    else if(update.channel_post != null){
      this.emitChannelPost(update.channel_post);
    }
    else if(update.edited_channel_post != null){
      this.emitEditedChannelPost(update.edited_channel_post);
    }
    else if(update.inline_query != null){
      this.emitInlineQuery(update.inline_query);
    }
    else if(update.chosen_inline_result != null){
      this.emitChosenInlineQuery(update.chosen_inline_result);
    }
    else if(update.callback_query != null){
      this.emitCallbackQuery(update.callback_query);
    }
    else if(update.pre_checkout_query != null){
      this.emitPreCheckoutQuery(update.pre_checkout_query);
    }
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