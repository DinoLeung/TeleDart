import 'dart:io' show Platform;
// import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  final Map<String, String> envVars = Platform.environment;

  TeleDart teledart = TeleDart(Telegram(envVars['BOT_TOKEN']), Event());

  // TeleDart uses longpull by default.
  teledart.startFetching();

  // In case you decided to use webhook.
  // teledart.setupWebhook(envVars['HOST_URL'], envVars['BOT_TOKEN'],
  //     io.File(envVars['CERT_PATH']), io.File(envVars['KEY_PATH']));
  // teledart.startFetching(webhook: true);

  // You can listen to messages like this
  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
      (message) =>
          teledart.telegram.sendMessage(message.from.id, 'Hello TeleDart!'));

  // Or using short cuts
  teledart
      .onCommand('short')
      .listen(((message) => teledart.replyMessage(message, 'This works too!')));

  // You can even filter streams even more diverse with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
  teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text.contains('telegram'))
      .listen((message) => teledart.replyPhoto(
          message,
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how Dash found the paper plane'));

  // Inline mode.
  teledart
      .onInlineQuery()
      .listen((inlineQuery) => teledart.answerInlineQuery(inlineQuery, [
            InlineQueryResultArticle()
              ..id = 'ping'
              ..title = 'ping'
              ..input_message_content = (InputTextMessageContent()
                ..message_text = '*pong*'
                ..parse_mode = 'markdown'),
            InlineQueryResultArticle()
              ..id = 'ding'
              ..title = 'ding'
              ..input_message_content = (InputTextMessageContent()
                ..message_text = '_dong_'
                ..parse_mode = 'markdown')
          ]));
}
