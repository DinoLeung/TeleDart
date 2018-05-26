import 'dart:async';

import '../../Telegram/Model.dart';

class Event {

  User me;

  StreamController _messageStreamController;
  StreamController _editedMessageStreamController;
  StreamController _channelPostStreamController;
  StreamController _editedChannelPostStreamController;
  StreamController _inlineQueryStreamController;
  StreamController _chosenInlineQueryStreamController;

  StreamController get messageStreamController => _messageStreamController;
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

  /// Listens to message events
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

  /// Emits message events
  void emitMessage(Message msg) {
    _messageStreamController.add(msg);
  }

  /// Listens to edited message events
  Stream<Message> onEditedMessage() {
    return _editedMessageStreamController.stream;
  }

  /// Emits edited message events
  void emitEditedMessage(Message msg) {
    _editedMessageStreamController.add(msg);
  }

  /// Listens to channel post events
  Stream<Message> onChannelPost() {
    return _channelPostStreamController.stream;
  }

  /// Emits channel post events
  void emitChannelPost(Message msg) {
    _channelPostStreamController.add(msg);
  }

  /// Listens to edited channel post events
  Stream<Message> onEditedChannelPost() {
    return _editedChannelPostStreamController.stream;
  }

  /// Emits edited channel post events
  void emitEditedChannelPost(Message msg) {
    _editedChannelPostStreamController.add(msg);
  }

  /// Listens to inline query events
  Stream<InlineQuery> onInlineQuery() {
    return _inlineQueryStreamController.stream;
  }

  /// Emits inline query events
  void emitInlineQuery(InlineQuery inline_query) {
    _inlineQueryStreamController.add(inline_query);
  }

  /// Listens to chosen inline query events
  Stream<ChosenInlineResult> onChosenInlineQuery() {
    return _chosenInlineQueryStreamController.stream;
  }

  /// Emits chosen inline query events
  void emitChosenInlineQuery(ChosenInlineResult chosen_inline_result) {
    _chosenInlineQueryStreamController.add(chosen_inline_result);
  }

  /// Listens to callback query events
  Stream<CallbackQuery> onCallbackQuery() {
    return _callbackQueryStreamController.stream;
  }

  /// Emits callback query events
  void emitCallbackQuery(CallbackQuery callback_query) {
    _callbackQueryStreamController.add(callback_query);
  }

  /// Listens to shipping query events
  Stream<ShippingQuery> onShippingQuery() {
    return _shippingQueryStreamController.stream;
  }

  /// Emits shipping query events
  void emitShippingQuery(ShippingQuery shipping_query) {
    _shippingQueryStreamController.add(shipping_query);
  }

  /// Listens to pre checkout query events
  Stream<PreCheckoutQuery> onPreCheckoutQuery() {
    return _preCheckoutQueryStreamController.stream;
  }

  /// Emits pre checkout query events
  void emitPreCheckoutQuery(PreCheckoutQuery pre_checkout_query) {
    _preCheckoutQueryStreamController.add(pre_checkout_query);
  }
}

class TeleDartEventException implements Exception{
  String cause;
  TeleDartEventException(this.cause);
  String toString() => 'TeleDartEventException: ${cause}';
}

