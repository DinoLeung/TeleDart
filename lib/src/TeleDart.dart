import 'dart:async';
import './Telegram.dart';
import './Model.dart';

class TeleDart{
  Telegram _tg;

  TeleDart(String token){
    _tg = new Telegram(token);
  }

  void startPolling() {
    // TODO: set interval for long polling
    // TODO: research long polling basics and pseudocode
    // TODO: find the right way to handle errors
    Future<List<Update>> updates = _tg.getUpdates();

    updates.then((updates) {
      for (Update update in updates) {
        print(update.update_id);
        print(update.message.text);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

}