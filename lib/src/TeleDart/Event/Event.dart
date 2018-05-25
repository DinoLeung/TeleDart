import 'dart:async';

import 'package:TeleDart/src/Telegram/Model.dart';

class Event {

  User me;

  StreamController _messageStreamController;
  StreamController _editedMessageStreamController;
  StreamController _channelPostStreamController;
  StreamController _editedChannelPostStreamController;
  StreamController _inlineQueryStreamController;
  StreamController _chosenInlineQueryStreamController;
  StreamController _callbackQueryStreamController;
  StreamController _shippingQueryStreamController;
  StreamController _preCheckoutQueryStreamController;

  Event({bool sync: false}) {
    _messageStreamController = new StreamController.broadcast(sync: sync);
    _editedMessageStreamController = new StreamController.broadcast(sync: sync);
    _channelPostStreamController = new StreamController.broadcast(sync: sync);
    _editedChannelPostStreamController = new StreamController.broadcast(sync: sync);
    _inlineQueryStreamController = new StreamController.broadcast(sync: sync);
    _chosenInlineQueryStreamController = new StreamController.broadcast(sync: sync);
    _callbackQueryStreamController = new StreamController.broadcast(sync: sync);
    _shippingQueryStreamController = new StreamController.broadcast(sync: sync);
    _preCheckoutQueryStreamController = new StreamController.broadcast(sync: sync);
  }

  // Message events
  Stream<Message> onMessage({String entityType, String keyword}) {
    if(entityType == null) {
      if (keyword == null) // no entityType and keyword
        return _messageStreamController.stream;
      else { // no entityType but keyword
        return _messageStreamController.stream.where((Message message) {
          if (message.text != null)
            return message.text.contains(keyword);
          else if (message.caption != null)
            return message.caption.contains(keyword);
          else
            return false;
        });
      }
    }
    else { // with entityType but no keyword
      if (keyword == null)
        return _messageStreamController.stream.where((Message message) =>
          message.entityOf(entityType) != null);
      else { // with entityType and keyword
        /**
         * entities and caption_entities
         * Type of the entity.
         * Can be mention (@username), hashtag, bot_command, url, email,
         * bold (bold text), italic (italic text), code (monowidth string),
         * pre (monowidth block), text_link (for clickable text URLs),
         * text_mention (for users without usernames)
         * normal message has NO entity
         */
        return _messageStreamController.stream.where((Message message) {
          switch (entityType){
            case 'mention':
              return message.getEntity(entityType) == '\@${keyword}';
              break;
            case 'hashtag':
              return message.getEntity(entityType) == '\#${keyword}';
              break;
            case 'bot_command':
              return message.getEntity(entityType) == '\/${keyword}'
                  || message.getEntity(entityType) == '\/${keyword}\@${me.username}';
              break;
            case 'url' :
            case 'email':
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
              return message.entityOf(entityType).user.id as String == keyword
                  || message.entityOf(entityType).user.first_name == keyword;
              break;
            default: //entityType not exist
              throw new TeleDartEventException('Update Type ${entityType} not exist');
              break;
          }
        });
      }
    }
  }
  void emitMessage(Message msg) {
    _messageStreamController.add(msg);
  }

  // Edited Messaged events
  Stream<Message> onEditedMessage() {
    return _editedMessageStreamController.stream;
  }
  void emitEditedMessage(Message msg) {
    _editedMessageStreamController.add(msg);
  }

  // Channel Post events
  Stream<Message> onChannelPost() {
    return _channelPostStreamController.stream;
  }
  void emitChannelPost(Message msg) {
    _channelPostStreamController.add(msg);
  }

  // Edited Channel Post events
  Stream<Message> onEditedChannelPost() {
    return _editedChannelPostStreamController.stream;
  }
  void emitEditedChannelPost(Message msg) {
    _editedChannelPostStreamController.add(msg);
  }

  // Inline Query events
  Stream<InlineQuery> onInlineQuery() {
    return _inlineQueryStreamController.stream;
  }
  void emitInlineQuery(InlineQuery inline_query) {
    _inlineQueryStreamController.add(inline_query);
  }

  // Chosen Inline Query events
  Stream<ChosenInlineResult> onChosenInlineQuery() {
    return _chosenInlineQueryStreamController.stream;
  }
  void emitChosenInlineQuery(ChosenInlineResult chosen_inline_result) {
    _chosenInlineQueryStreamController.add(chosen_inline_result);
  }

  // Callback Query events
  Stream<CallbackQuery> onCallbackQuery() {
    return _callbackQueryStreamController.stream;
  }
  void emitCallbackQuery(CallbackQuery callback_query) {
    _callbackQueryStreamController.add(callback_query);
  }

  // Shipping Query events
  Stream<ShippingQuery> onShippingQuery() {
    return _shippingQueryStreamController.stream;
  }
  void emitShippingQuery(ShippingQuery shipping_query) {
    _shippingQueryStreamController.add(shipping_query);
  }

  // Pre Checkout Query events
  Stream<PreCheckoutQuery> onPreCheckoutQuery() {
    return _preCheckoutQueryStreamController.stream;
  }
  void emitPreCheckoutQuery(PreCheckoutQuery pre_checkout_query) {
    _preCheckoutQueryStreamController.add(pre_checkout_query);
  }
}

class TeleDartEventException implements Exception{
  String cause;
  TeleDartEventException(this.cause);
  String toString() => 'TeleDartEventException: ${cause}';
}

