import 'package:TeleDart/src/Telegram/Model.dart';

class MessageEvent {
  final Message message;
  MessageEvent(this.message);
}

class InlineQueryEvent {
  InlineQuery inline_query;
  InlineQueryEvent(this.inline_query);
}

class ChosenInlineQueryEvent {
  ChosenInlineResult chosen_inline_result;
  ChosenInlineQueryEvent(this.chosen_inline_result);
}

class CallbackQueryEvent {
  CallbackQuery callback_query;
  CallbackQueryEvent(this.callback_query);
}

class ShippingQueryEvent {
  ShippingQuery shipping_query;
  ShippingQueryEvent(this.shipping_query);
}

class PreCheckoutQueryEvent {
  PreCheckoutQuery pre_checkout_query;
  PreCheckoutQueryEvent(this.pre_checkout_query);
}