import 'dart:async';

import 'package:TeleDart/src/TeleDart/EventObject.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class Event {

  User me;

  StreamController _commandStreamController;
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
    _commandStreamController = new StreamController.broadcast(sync: sync);
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

  // Commands events
  Stream<MessageEvent> onCommand([String flag]) {
    if (flag == null)
      return _commandStreamController.stream;
    else {
      return _commandStreamController.stream.where((MessageEvent event) =>
      event.message.getEntity('bot_command') == '\/${flag}'
          || event.message.getEntity('bot_command') == '\/${flag}\@${me.username}');
    }
  }
  void emitCommand(Message msg) {
    _commandStreamController.add(new MessageEvent(msg));
  }

  // Message events
  Stream<MessageEvent> onMessage([String text]) {
    if(text == null)
      return _messageStreamController.stream;
    else
      return _messageStreamController.stream.where((MessageEvent event) =>
        event.message.text.contains(text));
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

