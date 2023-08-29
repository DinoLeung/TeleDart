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
    } else if (update.editedMessage != null) {
      _editedMessageStreamController.add(update.editedMessage!);
    } else if (update.channelPost != null) {
      _channelPostStreamController.add(update.channelPost!);
    } else if (update.editedChannelPost != null) {
      _editedChannelPostStreamController.add(update.editedChannelPost!);
    } else if (update.inlineQuery != null) {
      _inlineQueryStreamController.add(update.inlineQuery!);
    } else if (update.chosenInlineResult != null) {
      _chosenInlineResultStreamController.add(update.chosenInlineResult!);
    } else if (update.callbackQuery != null) {
      _callbackQueryStreamController.add(update.callbackQuery!);
    } else if (update.shippingQuery != null) {
      _shippingQueryStreamController.add(update.shippingQuery!);
    } else if (update.preCheckoutQuery != null) {
      _preCheckoutQueryStreamController.add(update.preCheckoutQuery!);
    } else if (update.poll != null) {
      _pollStreamController.add(update.poll!);
    } else if (update.pollAnswer != null) {
      _pollAnswerStreamController.add(update.pollAnswer!);
    } else if (update.myChatMember != null) {
      _myChatMemberStreamController.add(update.myChatMember!);
    } else if (update.chatMember != null) {
      _chatMemberStreamController.add(update.chatMember!);
    } else if (update.chatJoinRequest != null) {
      _chatJoinRequestStreamController.add(update.chatJoinRequest!);
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
            return (message.entities ?? message.captionEntities) == null;
          } else {
            // no keyword but entityType
            return entityType == '*' || message.entityOf(entityType) != null;
          }
        } else {
          if (keyword is! String && keyword is! RegExp) {
            throw TeleDartEventException(
                'Attribute \'keyword\' accepts type of String or RegExp');
          } else if (entityType == null) {
            return (message.entities ?? message.captionEntities) == null &&
                (message.text ?? message.caption ?? '').contains(keyword);
          } else if (message.entityOf(entityType) == null) {
            return false;
          } else if (entityType == MessageEntity.typeTextMention) {
            var userId = message.entityOf(entityType)?.user?.id;
            var firstName = message.entityOf(entityType)?.user?.firstName;
            if (keyword is RegExp) {
              var matchFirstName =
                  firstName != null ? keyword.hasMatch(firstName) : false;
              var matchUserId =
                  userId != null ? keyword.hasMatch(userId.toString()) : false;
              return matchFirstName || matchUserId;
            } else {
              return keyword == firstName || keyword == userId;
            }
          } else {
            var entityText = '';

            switch (entityType) {
              case '*': // Any entityType
                entityText = (message.text ?? message.caption ?? '');
                break;
              case MessageEntity.typeMention: // '\@${keyword}'
              case MessageEntity.typeCashtag: // '\$${keyword}'
              case MessageEntity.typeHashtag: // '\#${keyword}'
                entityText = message.getEntity(entityType)?.substring(1) ?? '';
                break;
              case MessageEntity
                    .typeBotCommand: // '\/${keyword}' or '\/${keyword}\@${me.username}'
                entityText = message
                        .getEntity(entityType)
                        ?.substring(1)
                        .replaceAll('@$username', '') ??
                    '';
                break;
              case MessageEntity.typeUrl:
              case MessageEntity.typeEmail:
              case MessageEntity.typePhoneNmber:
              case MessageEntity.typeItalic:
              case MessageEntity.typeSpolier:
              case MessageEntity.typeCode:
              case MessageEntity
                    .typePre: // TODO: need to return language prop somehow
              case MessageEntity.typeUnderline:
              case MessageEntity.typeStrikethrough:
                entityText = message.getEntity(entityType) ?? '';
                break;
              case MessageEntity.typeTextLink:
                entityText = message.entityOf(entityType)?.url ?? '';
                break;
              case MessageEntity.typeCustomEmoji:
                entityText = message.entityOf(entityType)?.customEmojiId ?? '';
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
