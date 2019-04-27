/**
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
import 'dart:io' as io;

import '../../telegram/telegram.dart';
import '../../telegram/model.dart';

class LongPolling {
  final Telegram telegram;

  final MAX_TIMEOUT = 50;

  int offset;
  int limit;
  int timeout;
  List<String> allowed_updates;

  bool _isPolling = false;
  bool get isPolling => _isPolling;

  StreamController<Update> _updateStreamController;

  /// Setup long polling
  ///
  /// Throws [LongPollingException] if [limit] is less than 1 or greater than 100
  /// or [timeout] is greater than 50.
  LongPolling(this.telegram,
      {this.offset = 0,
      this.limit = 100,
      this.timeout = 30,
      this.allowed_updates}) {
    if (limit > 100 || limit < 1)
      throw LongPollingException('Limit must between 1 and 100.');
    if (timeout > MAX_TIMEOUT)
      throw LongPollingException(
          'Timeout may not greater than ${MAX_TIMEOUT}.');

    _updateStreamController = StreamController();
  }

  /// Stop the long poll.
  void stopPolling() {
    if (_isPolling) _isPolling = false;
  }

  /// Start the long poll, throws [LongPollingException] on error
  /// or a long poll is already in place.
  void startPolling() {
    if (!_isPolling) {
      _isPolling = true;
      _recursivePolling();
    } else
      throw LongPollingException('A long poll is aleady inplace');
  }

  /// Private long polling loop, throws [LongPollingException] on error.
  void _recursivePolling() {
    if (_isPolling)
      telegram
          .getUpdates(
              offset: offset,
              limit: limit,
              timeout: timeout,
              allowed_updates: allowed_updates)
          .then((updates) {
        if (updates.isNotEmpty) {
          for (Update update in updates) {
            emitUpdate(update);
            offset = update.update_id + 1;
          }
        }
        _recursivePolling();
      }).catchError((error) =>
              // TODO: find out what exceptions can be ignored
              error is io.HandshakeException
                  ? _recursivePolling()
                  : throw LongPollingException(error.toString()));
  }

  /// Add [update] to the stream.
  void emitUpdate(Update update) => _updateStreamController.add(update);

  /// When [update] is added to stream.
  Stream<Update> onUpdate() => _updateStreamController.stream;
}

class LongPollingException implements Exception {
  String cause;
  LongPollingException(this.cause);
  String toString() => 'LongPollingException: ${cause}';
}
