import 'dart:async';
import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class TeleDart{
  Telegram _tg;

  bool _webhook = false;
  final MAX_TIMEOUT = 60;

  TeleDart(String token){
    _tg = new Telegram(token);
  }

  void startPolling(
      {int offset = 0, int limit = 100, timeout = 30,
        List<String> allowed_updates}) {

    if(!_webhook){
      _tg.getUpdates(offset: offset, limit: limit,
          timeout: timeout, allowed_updates: allowed_updates)
          .then((updates) {
            if(updates.length > 0){
              for (Update update in updates) {
                // TODO: add updates to event queue
                print(update.update_id);
                print(update.message.text);
                offset = update.update_id + 1;
              }
            }
            startPolling(offset: offset, limit: limit,
                timeout: timeout, allowed_updates: allowed_updates);
          })
          .catchError((error) {
            print(error.toString());
          });
    }
    else {
      throw new Exception('TeleDart Error: Webhook is enabled.');
    }

  }

}