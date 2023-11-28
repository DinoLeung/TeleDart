import 'dart:io' show Platform;
// import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

Future<void> main() async {
  final envVars = Platform.environment;
  final username = (await Telegram(envVars['BOT_TOKEN']!).getMe()).username;

  // TeleDart uses longpoll by default if no update fetcher is specified.
  var teledart = TeleDart(envVars['BOT_TOKEN']!, Event(username!));

  // In case you decided to use webhook.
  // var webhook = await Webhook.createHttpsWebhok(
  //     Telegram(envVars['BOT_TOKEN']!),
  //     envVars['HOST_URL']!,
  //     io.File(envVars['CERT_PATH']!),
  //     io.File(envVars['KEY_PATH']!),
  //     port: int.parse(envVars['BOT_PORT']!),
  //     secretToken: envVars['SECRET_TOKEN']!);
  // var teledart = TeleDart(envVars['BOT_TOKEN']!, Event(username!), fetcher: webhook);

  teledart.start();

  // You can listen to messages like this
  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
      (message) => teledart.sendMessage(message.chat.id, 'Hello TeleDart!'));

  // Sick of boilerplates? Reply messages like below, nice and tidy
  // Short hands also available for answer query methods
  teledart.onCommand('glory').listen((message) => message.reply('to Ukraine!'));

  // You can also utilise regular expressions
  teledart
      .onCommand(RegExp('hello', caseSensitive: false))
      .listen((message) => message.reply('hi!'));

  // You can even filter streams with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
  teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text?.contains('telegram') ?? false)
      .listen((message) => message.replyPhoto(
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how Dash found the paper plane'));


