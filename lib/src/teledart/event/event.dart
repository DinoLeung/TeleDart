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

import '../../telegram/model.dart';

class Event {
  // User object of bot.
  User me;

  StreamController<Message> _messageStreamController;
  StreamController<Message> _editedMessageStreamController;
  StreamController<Message> _channelPostStreamController;
  StreamController<Message> _editedChannelPostStreamController;
  StreamController<InlineQuery> _inlineQueryStreamController;
  StreamController<ChosenInlineResult> _chosenInlineResultStreamController;
  StreamController<CallbackQuery> _callbackQueryStreamController;
  StreamController<ShippingQuery> _shippingQueryStreamController;
  StreamController<PreCheckoutQuery> _preCheckoutQueryStreamController;
  StreamController<Poll> _pollStreamController;

  /// Constructor
  Event({bool sync = false}) {
    _messageStreamController = StreamController.broadcast(sync: sync);
    _editedMessageStreamController = StreamController.broadcast(sync: sync);
    _channelPostStreamController = StreamController.broadcast(sync: sync);
    _editedChannelPostStreamController = StreamController.broadcast(sync: sync);
    _inlineQueryStreamController = StreamController.broadcast(sync: sync);
    _chosenInlineResultStreamController =
        StreamController.broadcast(sync: sync);
    _callbackQueryStreamController = StreamController.broadcast(sync: sync);
    _shippingQueryStreamController = StreamController.broadcast(sync: sync);
    _preCheckoutQueryStreamController = StreamController.broadcast(sync: sync);
    _pollStreamController = StreamController.broadcast(sync: sync);
  }

  /// Listens to message events
  Stream<Message> onMessage({String entityType, String keyword}) {
    if (entityType == null) {
      // no entityType and keyword
      if (keyword == null) {
        return _messageStreamController.stream.where((message) =>
            (message.entities ?? message.caption_entities) == null);
      } else {
        // no entityType but keyword
        // with regular expressions
        return _messageStreamController.stream
            .where((message) =>
                (message.entities ?? message.caption_entities) == null)
            .where((message) => (message.text ?? message.caption ?? '')
                .contains(RegExp(keyword)));
      }
    } else {
      // with entityType but no keyword
      if (keyword == null) {
        return _messageStreamController.stream.where((message) =>
            entityType == '*' || message.entityOf(entityType) != null);
      } else {
        // with entityType and keyword
        return _messageStreamController.stream.where((message) {
          switch (entityType) {
            case '*': // Any entityType
              return (message.text ?? message.caption ?? '')
                  .contains(RegExp(keyword));
            case 'mention':
              return message.getEntity(entityType) == '\@${keyword}';
              break;
            case 'cashtag':
              return message.getEntity(entityType) == '\$${keyword}';
            case 'hashtag':
              return message.getEntity(entityType) == '\#${keyword}';
              break;
            case 'bot_command':
              return message.getEntity(entityType) == '\/${keyword}' ||
                  message.getEntity(entityType) ==
                      '\/${keyword}\@${me.username}';
              break;
            case 'url':
            case 'email':
            case 'phone_number':
            case 'bold':
            case 'italic':
            case 'code':
            case 'pre':
              return message.getEntity(entityType) == '${keyword}';
              break;
            case 'text_link':
              return message.entityOf(entityType).url == '${keyword}';
              break;
            case 'text_mention':
              return message.entityOf(entityType).user.id as String ==
                      keyword ||
                  message.entityOf(entityType).user.first_name == keyword;
              break;
            default: // Dynamically listen to message types.
              return (message.getEntity(entityType) ?? '')
                  .contains(RegExp(keyword));
              break;
          }
        });
      }
    }
  }

  /// Emits update events
  void emitUpdate(Update update) {
    if (update == null) {
      throw TeleDartEventException('Update cannot not be null');
    } else if (update.message != null) {
      _messageStreamController.add(update.message);
    } else if (update.edited_message != null) {
      _editedMessageStreamController.add(update.edited_message);
    } else if (update.channel_post != null) {
      _channelPostStreamController.add(update.channel_post);
    } else if (update.edited_channel_post != null) {
      _editedChannelPostStreamController.add(update.edited_channel_post);
    } else if (update.inline_query != null) {
      _inlineQueryStreamController.add(update.inline_query);
    } else if (update.chosen_inline_result != null) {
      _chosenInlineResultStreamController.add(update.chosen_inline_result);
    } else if (update.callback_query != null) {
      _callbackQueryStreamController.add(update.callback_query);
    } else if (update.shipping_query != null) {
      _shippingQueryStreamController.add(update.shipping_query);
    } else if (update.pre_checkout_query != null) {
      _preCheckoutQueryStreamController.add(update.pre_checkout_query);
    } else if (update.poll != null) {
      _pollStreamController.add(update.poll);
    } else {
      throw TeleDartEventException('Object in Update cannot be null');
    }
  }

  /// Listens to edited message events
  Stream<Message> onEditedMessage() => _editedMessageStreamController.stream;

  /// Listens to channel post events
  Stream<Message> onChannelPost() => _channelPostStreamController.stream;

  /// Listens to edited channel post events
  Stream<Message> onEditedChannelPost() =>
      _editedChannelPostStreamController.stream;

  /// Listens to inline query events
  Stream<InlineQuery> onInlineQuery() => _inlineQueryStreamController.stream;

  /// Listens to chosen inline query events
  Stream<ChosenInlineResult> onChosenInlineResult() =>
      _chosenInlineResultStreamController.stream;

  /// Listens to callback query events
  Stream<CallbackQuery> onCallbackQuery() =>
      _callbackQueryStreamController.stream;

  /// Listens to shipping query events
  Stream<ShippingQuery> onShippingQuery() =>
      _shippingQueryStreamController.stream;

  /// Listens to pre checkout query events
  Stream<PreCheckoutQuery> onPreCheckoutQuery() =>
      _preCheckoutQueryStreamController.stream;

  /// Listen to poll events
  Stream<Poll> onPoll() => _pollStreamController.stream;
}

class TeleDartEventException implements Exception {
  String cause;
  TeleDartEventException(this.cause);
  String toString() => 'TeleDartEventException: ${cause}';
}
