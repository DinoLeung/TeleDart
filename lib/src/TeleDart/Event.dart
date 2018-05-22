import 'dart:async';

import 'package:TeleDart/src/TeleDart/EventObject.dart';
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
  Stream<MessageEvent> onMessage({String entityType, String keyword}) {
    if(entityType == null && keyword == null)
      return _messageStreamController.stream;
    else {
      if(entityType != null && keyword != null){
        /**
         * entities and caption_entities
         * Type of the entity.
         * Can be mention (@username), hashtag, bot_command, url, email,
         * bold (bold text), italic (italic text), code (monowidth string),
         * pre (monowidth block), text_link (for clickable text URLs),
         * text_mention (for users without usernames)
         * normal message has NO entity
         */
        return _messageStreamController.stream.where((MessageEvent event) {
          switch (entityType){
            case 'mention':
              return event.message.getEntity(entityType) == '\@${keyword}';
              break;
            case 'hashtag':
              return event.message.getEntity(entityType) == '\#${keyword}';
              break;
            case 'bot_command':
              return event.message.getEntity(entityType) == '\/${keyword}'
                  || event.message.getEntity(entityType) == '\/${keyword}\@${me.username}';
              break;
            case 'url' :
            case 'email':
            case 'bold':
            case 'italic':
            case 'code':
            case 'pre':
            return event.message.getEntity(entityType) == '${keyword}';
              break;
            case 'text_link':
              return event.message.entityOf(entityType).url == '${keyword}';
              break;
            case 'text_mention':
              return event.message.entityOf(entityType).user.id as String == keyword
                  || event.message.entityOf(entityType).user.first_name == keyword;
              break;
            default: //entityType not exist
              throw new TeleDartEventException('Entity Type ${entityType} not exist');
              break;
          }
        });
      }
      else {
        if(entityType != null)
          return _messageStreamController.stream.where((MessageEvent event) =>
          event.message.entityOf(entityType) != null);
        else // normal message
          return _messageStreamController.stream.where((MessageEvent event) {
            if(event.message.text != null)
              return event.message.text.contains(keyword);
            else if(event.message.caption != null)
              return event.message.caption.contains(keyword);
            else
              return false;
        });
      }
    }
  }
  void emitMessage(Message msg) {
    _messageStreamController.add(new MessageEvent(msg));
  }

  // Edited Messaged events
  Stream<MessageEvent> onEditedMessage() {
    return _editedMessageStreamController.stream;
  }
  void emitEditedMessage(Message msg) {
    _editedMessageStreamController.add(new MessageEvent(msg));
  }

  // Channel Post events
  Stream<MessageEvent> onChannelPost() {
    return _channelPostStreamController.stream;
  }
  void emitChannelPost(Message msg) {
    _channelPostStreamController.add(new MessageEvent(msg));
  }

  // Edited Channel Post events
  Stream<MessageEvent> onEditedChannelPost() {
    return _editedChannelPostStreamController.stream;
  }
  void emitEditedChannelPost(Message msg) {
    _editedChannelPostStreamController.add(new MessageEvent(msg));
  }

  // Inline Query events
  Stream<InlineQueryEvent> onInlineQuery() {
    return _inlineQueryStreamController.stream;
  }
  void emitInlineQuery(InlineQuery inline_query) {
    _inlineQueryStreamController.add(new InlineQueryEvent(inline_query));
  }

  // Chosen Inline Query events
  Stream<ChosenInlineQueryEvent> onChosenInlineQuery() {
    return _chosenInlineQueryStreamController.stream;
  }
  void emitChosenInlineQuery(ChosenInlineResult chosen_inline_result) {
    _chosenInlineQueryStreamController.add(new ChosenInlineQueryEvent(chosen_inline_result));
  }

  // Callback Query events
  Stream<CallbackQueryEvent> onCallbackQuery() {
    return _callbackQueryStreamController.stream;
  }
  void emitCallbackQuery(CallbackQuery callback_query) {
    _callbackQueryStreamController.add(new CallbackQueryEvent(callback_query));
  }

  // Shipping Query events
  Stream<ShippingQueryEvent> onShippingQuery() {
    return _shippingQueryStreamController.stream;
  }
  void emitShippingQuery(ShippingQuery shipping_query) {
    _shippingQueryStreamController.add(new ShippingQueryEvent(shipping_query));
  }

  // Pre Checkout Query events
  Stream<PreCheckoutQueryEvent> onPreCheckoutQuery() {
    return _preCheckoutQueryStreamController.stream;
  }
  void emitPreCheckoutQuery(PreCheckoutQuery pre_checkout_query) {
    _preCheckoutQueryStreamController.add(new PreCheckoutQueryEvent(pre_checkout_query));
  }
}

class TeleDartEventException {
  String cause;
  TeleDartEventException(this.cause);
  String toString() => 'TeleDartEventException: ${cause}';
}

