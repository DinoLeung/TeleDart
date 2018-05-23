import 'dart:async';
import 'dart:io';

import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class LongPolling {

  // TODO: implement stop polling method

  Telegram telegram;

  final MAX_TIMEOUT = 50;

  int offset;
  int limit;
  int timeout;
  List<String> allowed_updates;

  StreamController _updateStreamController;

  LongPolling(this.telegram,
      {this.offset: 0, this.limit: 100, this.timeout: 30,
        this.allowed_updates}) {
    _updateStreamController = new StreamController();
  }

  void startPolling() {

    if(limit > 100 || limit < 1)
      throw new LongPollingException('Limit must between 1 and 100.');
    if(timeout > MAX_TIMEOUT)
      throw new LongPollingException('Timeout may not greater than ${MAX_TIMEOUT}.');

    telegram.getUpdates(offset: offset, limit: limit,
        timeout: timeout, allowed_updates: allowed_updates)
      .then((updates) {
        if(updates.length > 0){
          for (Update update in updates) {
            _updateStreamController.add(update);
            offset = update.update_id + 1;
          }
        }
        startPolling();
      })
      .catchError((error) {
        // TODO: find out what exceptions can be ignored
        print(error.toString());
        if(error is HandshakeException)
          startPolling();
        else
          throw new LongPollingException(error.toString());
      });
  }

  // Edited Messaged events
  Stream<Update> onUpdate() {
    return _updateStreamController.stream;
  }
}

class LongPollingException implements Exception {
  String cause;
  LongPollingException(this.cause);
  String toString() => 'LongPollingException: ${cause}';
}