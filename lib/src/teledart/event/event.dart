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

import 'dart:async';

import '../teledart.dart';
import '../../telegram/model.dart';

/// This class listens to various events, such as message edits
/// or new channel posts.
///
/// You probably want to use its methods through [TeleDart], rather
/// than accessing them directly.
class Event {
  final String username;

  final StreamController<Message> _messageStreamController;
  final StreamController<Message> _editedMessageStreamController;
  final StreamController<Message> _channelPostStreamController;
  final StreamController<Message> _editedChannelPostStreamController;
  final StreamController<InlineQuery> _inlineQueryStreamController;
  final StreamController<ChosenInlineResult>
      _chosenInlineResultStreamController;
  final StreamController<CallbackQuery> _callbackQueryStreamController;
  final StreamController<ShippingQuery> _shippingQueryStreamController;
  final StreamController<PreCheckoutQuery> _preCheckoutQueryStreamController;
  final StreamController<Poll> _pollStreamController;
  final StreamController<PollAnswer> _pollAnswerStreamController;
  final StreamController<ChatMemberUpdated> _myChatMemberStreamController;
  final StreamController<ChatMemberUpdated> _chatMemberStreamController;
  final StreamController<ChatJoinRequest> _chatJoinRequestStreamController;

  Event(this.username, {bool sync = false})
      : _messageStreamController = StreamController.broadcast(sync: sync),
        _editedMessageStreamController = StreamController.broadcast(sync: sync),
        _channelPostStreamController = StreamController.broadcast(sync: sync),
        _editedChannelPostStreamController =
            StreamController.broadcast(sync: sync),
        _inlineQueryStreamController = StreamController.broadcast(sync: sync),
        _chosenInlineResultStreamController =
            StreamController.broadcast(sync: sync),
        _callbackQueryStreamController = StreamController.broadcast(sync: sync),
        _shippingQueryStreamController = StreamController.broadcast(sync: sync),
        _preCheckoutQueryStreamController =
            StreamController.broadcast(sync: sync),
        _pollStreamController = StreamController.broadcast(sync: sync),
        _pollAnswerStreamController = StreamController.broadcast(sync: sync),
        _myChatMemberStreamController = StreamController.broadcast(sync: sync),
        _chatMemberStreamController = StreamController.broadcast(sync: sync),
        _chatJoinRequestStreamController =
            StreamController.broadcast(sync: sync);

  /// Emits update events
  void emitUpdate(Update update) {
    if (update.message != null) {
      _messageStreamController.add(update.message!);
    } else if (update.edited_message != null) {
      _editedMessageStreamController.add(update.edited_message!);
    } else if (update.channel_post != null) {
      _channelPostStreamController.add(update.channel_post!);
    } else if (update.edited_channel_post != null) {
      _editedChannelPostStreamController.add(update.edited_channel_post!);
    } else if (update.inline_query != null) {
      _inlineQueryStreamController.add(update.inline_query!);
    } else if (update.chosen_inline_result != null) {
      _chosenInlineResultStreamController.add(update.chosen_inline_result!);
    } else if (update.callback_query != null) {
      _callbackQueryStreamController.add(update.callback_query!);
    } else if (update.shipping_query != null) {
      _shippingQueryStreamController.add(update.shipping_query!);
    } else if (update.pre_checkout_query != null) {
      _preCheckoutQueryStreamController.add(update.pre_checkout_query!);
    } else if (update.poll != null) {
      _pollStreamController.add(update.poll!);
    } else if (update.poll_answer != null) {
      _pollAnswerStreamController.add(update.poll_answer!);
    } else if (update.my_chat_member != null) {
      _myChatMemberStreamController.add(update.my_chat_member!);
    } else if (update.chat_member != null) {
      _chatMemberStreamController.add(update.chat_member!);
    } else if (update.chat_join_request != null) {
      _chatJoinRequestStreamController.add(update.chat_join_request!);
    } else {
      throw TeleDartEventException('Receieved unrecognised update');
    }
  }

  /// Listens to message events
  ///
  /// For the documentation, check [TeleDart.onMessage].
  Stream<Message> onMessage({String? entityType, dynamic keyword}) =>
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
          if (keyword is! String && keyword is! RegExp) {
            throw TeleDartEventException(
                'Attribute \'keyword\' accepts type of String or RegExp');
          } else if (entityType == null) {
            return (message.entities ?? message.caption_entities) == null &&
                (message.text ?? message.caption ?? '').contains(keyword);
          } else if (message.entityOf(entityType) == null) {
            return false;
          } else if (entityType == MessageEntity.TEXT_MENTION) {
            var userId = message.entityOf(entityType)?.user?.id;
            var firstName = message.entityOf(entityType)?.user?.first_name;
            if (keyword is RegExp) {
              var hasMatch = false;
              if (firstName != null) {
                hasMatch = keyword.hasMatch(firstName);
              }
              if (userId != null) {
                hasMatch = keyword.hasMatch(userId.toString());
              }
              return hasMatch;
            } else {
              return keyword == firstName || keyword == userId;
            }
          } else {
            var entityText = '';

            switch (entityType) {
              case '*': // Any entityType
                entityText = (message.text ?? message.caption ?? '');
                break;
              case MessageEntity.MENTION: // '\@${keyword}'
              case MessageEntity.CASHTAG: // '\$${keyword}'
              case MessageEntity.HASHTAG: // '\#${keyword}'
                entityText = message.getEntity(entityType)?.substring(1) ?? '';
                break;
              case 'bot_command': // '\/${keyword}' or '\/${keyword}\@${me.username}'
                entityText = message
                        .getEntity(entityType)
                        ?.substring(1)
                        .replaceAll('@$username', '') ??
                    '';
                break;
              case MessageEntity.URL:
              case MessageEntity.EMAIL:
              case MessageEntity.PHONE_NUMBER:
              case MessageEntity.BOLD:
              case MessageEntity.ITALIC:
              case MessageEntity.SPOILER:
              case MessageEntity.CODE:
              case MessageEntity.PRE:
              case MessageEntity.UNDERLINE:
              case MessageEntity.STRIKETHROUGH:
                entityText = message.getEntity(entityType) ?? '';
                break;
              case MessageEntity.TEXT_LINK:
                entityText = message.entityOf(entityType)?.url ?? '';
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

  /// Listen to chat join request events
  Stream<ChatJoinRequest> onChatJoinRequest() =>
      _chatJoinRequestStreamController.stream;
}

class TeleDartEventException implements Exception {
  String cause;
  TeleDartEventException(this.cause);
  @override
  String toString() => 'TeleDartEventException: $cause';
}
