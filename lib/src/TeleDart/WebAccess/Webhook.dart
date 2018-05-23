import 'dart:async';
import 'dart:io';

import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class Webhook {

  Telegram telegram;

  Webhook();
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  String toString() => 'WebhookException: ${cause}';
}