import 'dart:io' as io;

import 'package:TeleDart/TeleDart.dart';
import 'package:TeleDart/Telegram.dart';

void main() {
  TeleDart teledart = new TeleDart(new Telegram('YOUR_BOT_TOKEN'), new Event());

  teledart.startFetching();

  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen((message) {
    teledart.telegram.sendMessage(message.from.id, 'Hello TeleDart!');
  });

  teledart.onMessage(keyword: 'TeleDart').listen((message) {
    teledart.telegram.sendPhoto(
        message.from.id,
        new io.File('example/dart_bird_catchs_telegram.png'),
        caption: 'This is how the Dart Bird and Telegram are met');
  });
}
