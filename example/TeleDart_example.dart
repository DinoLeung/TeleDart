import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  TeleDart teledart = new TeleDart(new Telegram('YOUR_BOT_TOKEN'), new Event());

  teledart.startFetching();

  // You can listen to messages like its
  teledart.onMessage(entityType: 'bot_command', keyword: 'start')
      .listen((message) {
        teledart.telegram.sendMessage(message.from.id, 'Hello TeleDart!');
      });

  // Or using short cuts
  teledart.onCommand('short').listen(((message) =>
      teledart.replyMessage(message, 'This works too!')));

  // You can even filter streams even more diverse with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-process-a-stream
  teledart.onMessage(keyword: 'dart')
      .where((Message message) =>
          message.text.contains('telegram'))
      .listen((message) {
    teledart.replyPhoto(
            message,
//            new io.File('example/dart_bird_catchs_telegram.png'),
            'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.png',
            caption: 'This is how the Dart Bird and Telegram are met');
  });
}
