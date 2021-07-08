import 'dart:io' show Platform;
// import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

Future<void> main() async {
  final envVars = Platform.environment;

  var telegram = Telegram(envVars['BOT_TOKEN']!);
  var event = Event((await telegram.getMe()).username!);

  // Use Long poll by default.
  var teledart = TeleDart(telegram, event);

  // In case you decided to use webhook.
  // var webhook = await Webhook.createHttpsWebhok(
  //     telegram,
  //     envVars['HOST_URL']!,
  //     envVars['BOT_TOKEN']!,
  //     io.File(envVars['CERT_PATH']!),
  //     io.File(envVars['KEY_PATH']!),
  //     port: int.parse(envVars['BOT_PORT']!));
  // var teledart = TeleDart(telegram, event, fetcher: webhook);

  // TeleDart uses longpoll by default if no update fetcher is specified.
  // teledart.start().then((me) => print('${me.username} is initialised'));
  teledart.start();

  // You can listen to messages like this
  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
      (message) =>
          teledart.telegram.sendMessage(message.chat.id, 'Hello TeleDart!'));

  // Or using short cuts
  teledart
      .onCommand('short')
      .listen(((message) => teledart.replyMessage(message, 'This works too!')));

  // You can also utilise regular expressions
  teledart.onCommand(RegExp('hello', caseSensitive: false)).listen(
      (message) => teledart.telegram.sendMessage(message.chat.id, 'hi!'));

  // You can even filter streams with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
  teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text?.contains('telegram') ?? false)
      .listen((message) => teledart.replyPhoto(
          message,
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how Dash found the paper plane'));

  // Sick of boilerplates? Reply messages like below, nice and tidy
  // Short hands also available for answer query methods
  teledart
      .onMessage(keyword: 'Fight for freedom')
      .listen((message) => message.reply('Stand with Hong Kong'));

  // Inline mode.
  teledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
        InlineQueryResultArticle(
            id: 'ping',
            title: 'ping',
            input_message_content: InputTextMessageContent(
                message_text: '*pong*', parse_mode: 'MarkdownV2')),
        InlineQueryResultArticle(
            id: 'ding',
            title: 'ding',
            input_message_content: InputTextMessageContent(
                message_text: '*_dong_*', parse_mode: 'MarkdownV2')),
      ]));
}
