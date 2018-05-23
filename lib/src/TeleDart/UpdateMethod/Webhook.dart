import 'dart:async';
import 'dart:io' as io;

import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class Webhook {

  Telegram telegram;

  String url;
  io.File certificate;
  int max_connections;
  List<String> allowed_updates;

  Webhook(Telegram telegram, String url,
      {io.File certificate, int max_connections: 40,
        List<String> allowed_updates});

  Future setWebhook() async {
    telegram
        .setWebhook(url, certificate: certificate,
            max_connections: max_connections, allowed_updates: allowed_updates)
        .catchError((error) =>
            new Future.error(new WebhookException(error.toString())));
  }

  Future deleteWebhook() async {
    telegram.deleteWebhook()
        .catchError((error) =>
            new Future.error(new WebhookException(error.toString())));
  }

  void stopWebhook() {
    // TODO: implement me
  }

  void startWebhook() {
    // TODO: implement me
  }
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  String toString() => 'WebhookException: ${cause}';
}