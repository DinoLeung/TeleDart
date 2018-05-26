import 'dart:async';
import 'dart:io' as io;

import '../../Telegram/Telegram.dart';
import '../../Telegram/Model.dart';

class LongPolling {

  Telegram telegram;

  final MAX_TIMEOUT = 50;

  int offset;
  int limit;
  int timeout;
  List<String> allowed_updates;

  bool _isPolling = false;
  bool get isPolling => _isPolling;

  StreamController _updateStreamController;

  LongPolling(this.telegram,
      {this.offset: 0, this.limit: 100, this.timeout: 30,
        this.allowed_updates}) {

    if(limit > 100 || limit < 1)
      throw new LongPollingException('Limit must between 1 and 100.');
    if(timeout > MAX_TIMEOUT)
      throw new LongPollingException('Timeout may not greater than ${MAX_TIMEOUT}.');

    _updateStreamController = new StreamController();
  }

  void stopPolling() {
    if (_isPolling)
      _isPolling = false;
  }

  void startPolling() {
    if (!_isPolling){
      _isPolling = true;
      _recursivePolling();
    }
    else
      throw new LongPollingException('A long poll is aleady inplace');
  }

  void _recursivePolling() {
    if (_isPolling)
      telegram.getUpdates(offset: offset, limit: limit,
          timeout: timeout, allowed_updates: allowed_updates)
          .then((updates) {
            if(updates.length > 0){
              for (Update update in updates) {
                emitUpdate(update);
                offset = update.update_id + 1;
              }
            }
            _recursivePolling();
          })
          .catchError((error) {
        // TODO: find out what exceptions can be ignored
//        print(error.toString());
            if(error is io.HandshakeException)
              _recursivePolling();
            else
              throw new LongPollingException(error.toString());
          });
  }

  void emitUpdate(Update update) =>
      _updateStreamController.add(update);

  Stream<Update> onUpdate() =>
      _updateStreamController.stream;
}

class LongPollingException implements Exception {
  String cause;
  LongPollingException(this.cause);
  String toString() => 'LongPollingException: ${cause}';
}