import 'dart:async';
import 'dart:io';
import 'package:events/events.dart';
import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class TeleDart extends Events{
  Telegram _tg;

  bool _webhook = false;
  final MAX_TIMEOUT = 60;

  TeleDart(String token) : super(){
    _tg = new Telegram(token);
  }

  void startPolling(
      {int offset: 0, int limit: 100, timeout: 30,
        List<String> allowed_updates}){

    if(_webhook)
      throw new TeleDartException('Webhook is enabled.');
    if(timeout > MAX_TIMEOUT)
      throw new TeleDartException('Timeout may not greater than 60.');

    _tg.getUpdates(offset: offset, limit: limit,
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
        // TODO: find out what exceptions can be ignored
        .catchError((error) {
          if(error is HandshakeException)
            startPolling(offset: offset, limit: limit,
                timeout: timeout, allowed_updates: allowed_updates);
          else
            throw new Exception(error.toString());
        });
  }

  // TODO: add updates to event queue
  void updatesHandler(Update update){
    print('${update.update_id}: ${update.message.text}');
    if(update.message != null){
      // bot commands
      if(update.message.text.startsWith('\/')){
        // get the command flag
        String flag = update.message.text.substring(1);
        if(flag.contains(' '))
          flag = flag.substring(0, flag.indexOf(' '));
        if(flag.contains('\@'))
          flag = flag.substring(0, flag.indexOf('\@'));
        this.emit(flag, update.message);
      }
      else
        this.emit('message', update.message);
    }
    else if(update.edited_messaged != null){
      this.emit('edited_messaged', update.edited_messaged);
    }
    else if(update.channel_post != null){
      this.emit('channel_post', update.channel_post);
    }
    else if(update.inline_query != null){
      this.emit('inline_query', update.inline_query);
    }
    else if(update.chosen_inline_result != null){
      this.emit('chosen_inline_result', update.chosen_inline_result);
    }
    else if(update.callback_query != null){
      this.emit('callback_query', update.callback_query);
    }
    else if(update.pre_checkout_query != null){
      this.emit('callback_query', update.callback_query);
    }
  }
}

class TeleDartException implements Exception {
  String cause;
  TeleDartException(this.cause);
}