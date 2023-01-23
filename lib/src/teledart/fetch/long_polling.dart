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

import 'dart:core';
import 'dart:io';

import '../../telegram/telegram.dart';
import '../../util/http_client.dart';
import 'abstract_update_fetcher.dart';

/// Update fetcher which uses the long polling method.
///
/// It is the default update fetching method, see [TeleDart.start]
/// to learn how to use webhooks instead.
class LongPolling extends AbstractUpdateFetcher {
  final Telegram telegram;

  final maxTimeout = 50;

  int offset;
  int limit;
  int timeout;
  List<String>? allowedUpdates;

  bool _isPolling = false;
  bool get isPolling => _isPolling;

  Duration retryDelay = Duration(minutes: 1);

  /// Setup long polling
  ///
  /// Throws [LongPollingException] if [limit] is less than 1 or greater than 100
  /// or [timeout] is greater than 50.
  LongPolling(this.telegram,
      {this.offset = 0,
      this.limit = 100,
      this.timeout = 30,
      this.allowedUpdates}) {
    if (limit > 100 || limit < 1) {
      throw LongPollingException('Limit must between 1 and 100.');
    }
    if (timeout > maxTimeout) {
      throw LongPollingException('Timeout may not greater than $maxTimeout.');
    }
  }

  /// Stop the long poll.
  @override
  Future<void> stop() {
    if (_isPolling) _isPolling = false;
    return Future.value();
  }

  /// Start the long poll, throws [LongPollingException] on error
  /// or a long poll is already in place.
  @override
  Future<void> start() {
    if (!_isPolling) {
      _isPolling = true;
      return _recursivePolling();
    } else {
      throw LongPollingException('A long poll is aleady inplace');
    }
  }

  /// Private long polling loop, throws [LongPollingException] on error.
  /// Automatically retry on exception except HTTP Client error (400).
  /// Double the retry delay timeout on each error, resets timeout on success.
  Future<void> _recursivePolling() {
    if (_isPolling) {
      telegram
          .getUpdates(
              offset: offset,
              limit: limit,
              timeout: timeout,
              allowedUpdates: allowedUpdates)
          .then((updates) {
        if (updates.isNotEmpty) {
          for (var update in updates) {
            emitUpdate(update);
            offset = update.updateId + 1;
          }
        }
        _resetRetryDelay();
        _recursivePolling();
      }).catchError((error) {
        error is HttpClientException
            ? _onRecursivePollingHttpError(error)
            : _onRecursivePollingError(error);
      });
    }
    return Future.value();
  }

  Future<void> _onRecursivePollingHttpError(HttpClientException error) async {
    if (error.code != 429 && error.isHttpClientError()) {
      _isPolling = false;
      throw LongPollingException(error.toString());
    } else {
      // Too many requests (awaiting 5 seconds)
      if (error.code == 429) {
        await _onTooManyRequestHttpError(error);
      }

      _onRecursivePollingError(error);
    }
  }

  Future<void> _onTooManyRequestHttpError(HttpClientException error) async {
    // https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429
    // https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After

    final defaultWait = const Duration(milliseconds: 2500);
    final matchingHeaders = error.headers.entries
        .where((item) => item.key.toLowerCase().trim() == 'retry-after');

    // [1]: No retry-after header (Default wait to 2500 ms)
    if (matchingHeaders.isEmpty) {
      return Future.delayed(defaultWait);
    }

    final retryAfter = matchingHeaders.first.value;

    // [2]: Datetime mode
    final retryAfterDatetime = DateTime.tryParse(retryAfter);
    if (retryAfterDatetime != null) {
      final diff = retryAfterDatetime.difference(DateTime.now());

      // No need to wait
      if (diff.isNegative) {
        return;
      }

      return Future.delayed(diff);
    }

    // [3]: Seconds mode
    final retryAfterSeconds = int.tryParse(retryAfter);
    if (retryAfterSeconds != null) {
      return Future.delayed(Duration(seconds: retryAfterSeconds));
    }

    // [4]: Bad retry-after value
    return Future.delayed(defaultWait);
  }

  void _onRecursivePollingError(Object error) {
    print('${DateTime.now()} $error');
    print('Retrying in ${retryDelay.inMinutes} minute(s)...');
    _delayRetry();
    _doubleRetryDelay();
    _recursivePolling();
  }

  void _resetRetryDelay() => retryDelay = Duration(minutes: 1);
  void _doubleRetryDelay() => retryDelay *= 2;
  void _delayRetry() => sleep(retryDelay);
}

class LongPollingException implements Exception {
  String cause;
  LongPollingException(this.cause);
  @override
  String toString() => 'LongPollingException: $cause';
}
