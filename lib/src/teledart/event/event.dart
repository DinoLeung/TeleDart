/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';

import '../../telegram/model.dart';

class Event {
  /// User object of bot.
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
  StreamController<PollAnswer> _pollAnswerStreamController;
  StreamController<ChatMemberUpdated> _myChatMemberStreamController;
  StreamController<ChatMemberUpdated> _chatMemberStreamController;

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
    _pollAnswerStreamController = StreamController.broadcast(sync: sync);
    _myChatMemberStreamController = StreamController.broadcast(sync: sync);
    _chatMemberStreamController = StreamController.broadcast(sync: sync);
  }

  /// Listens to message events
  Stream<Message> onMessage({String entityType, dynamic keyword}) =>
      _messageStreamController.stream.where((message) {
        if (keyword == null) {
          if (entityType == null) {
            // no keyword and entityType
            return (message.entities ?? message.caption_entities) == null;
          } else {
            // no keyword but entityType
            return entityType == '*' || message.entityOf(entityType) != null;
          }
        } else {
          if (!(keyword is String) && !(keyword is RegExp)) {
            throw TeleDartEventException(
                'Attribute \'keyword\' accepts type of String or RegExp');
          } else if (entityType == null) {
            return (message.entities ?? message.caption_entities) == null &&
                (message.text ?? message.caption ?? '').contains(keyword);
          } else if (message.entityOf(entityType) == null) {
            return false;
          } else if (entityType == 'text_mention') {
            var userId = message.entityOf(entityType).user.id as String;
            var userName = message.entityOf(entityType).user.first_name;
            if (keyword is RegExp) {
              return keyword.hasMatch(userName) || keyword.hasMatch(userId);
            } else {
              return keyword == userName || keyword == userId;
            }
          } else {
            var entityText = '';

            switch (entityType) {
              case '*': // Any entityType
                entityText = (message.text ?? message.caption ?? '');
                break;
              case 'mention': //'\@${keyword}'
              case 'cashtag': //'\$${keyword}'
              case 'hashtag': //'\#${keyword}'
                entityText = message.getEntity(entityType).isNotEmpty
                    ? message.getEntity(entityType).substring(1)
                    : '';
                break;
              case 'bot_command': //'\/${keyword}' or '\/${keyword}\@${me.username}'
                entityText = message.getEntity(entityType).isNotEmpty
                    ? message
                        .getEntity(entityType)
                        .substring(1)
                        .replaceAll('\@${me.username}', '')
                    : '';
                break;
              case 'url':
              case 'email':
              case 'phone_number':
              case 'bold':
              case 'italic':
              case 'code':
              case 'pre':
              case 'underline':
              case 'strikethrough':
                entityText = message.getEntity(entityType) ?? '';
                break;
              case 'text_link':
                entityText = message.entityOf(entityType).url ?? '';
                break;
              default: // Dynamically listen to message types.
                entityText = message.getEntity(entityType) ?? '';
                break;
            }

            if (keyword is RegExp) {
              return keyword.hasMatch(entityText);
            } else {
              return keyword == entityText;
            }
          }
        }
      });

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
    } else if (update.poll_answer != null) {
      _pollAnswerStreamController.add(update.poll_answer);
    } else if (update.my_chat_member != null) {
      _myChatMemberStreamController.add(update.my_chat_member);
    } else if (update.chat_member != null) {
      _chatMemberStreamController.add(update.chat_member);
    } else {
      throw TeleDartEventException('Receieved unrecognised update');
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

  /// Listen to poll answer events
  Stream<PollAnswer> onPollAnswer() => _pollAnswerStreamController.stream;

  /// Listen to my chat member events
  Stream<ChatMemberUpdated> onMyChatMember() =>
      _myChatMemberStreamController.stream;

  /// Listen to chat member events
  Stream<ChatMemberUpdated> onChatMember() =>
      _chatMemberStreamController.stream;
}

class TeleDartEventException implements Exception {
  String cause;
  TeleDartEventException(this.cause);
  @override
  String toString() => 'TeleDartEventException: $cause';
}
