# TeleDart

A clean implementation of [Telegram bot API](https://core.telegram.org/bots/api) allows you to create your own easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-6.4-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.18-blue.svg?style=flat-square)](https://dart.dev)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)

[![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=DinoLeung&repo=TeleDart)](https://github.com/DinoLeung/TeleDart)

## Creating a Telegram bot

In order to create a Telegram bot, you need to talk to [@BotFather](https://t.me/botfather) generating a bot token. Simply follow the [instructions](https://core.telegram.org/bots#6-botfather).

## Usage

Initialising the bot:

```dart
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() {
  var BOT_TOKEN = 'YOUR_BOT_TOKEN_FROM_BOT_FATHER';6002507169:AAGQHx7NT4Mkvdpaw3DBbbCcry8n7IW3KgQ
  final username = (await Telegram(BOT_TOKEN).getMe()).username;@Jedle707
  var teledart = TeleDart(BOT_TOKEN, Event(username!));@Siti_call_bot

  teledart.start()
}
```

A simple usage example:

```dart
teledart.onMessage(keyword: 'Fight for freedom')
    .listen((message) => message.reply('Stand with Hong Kong'));
```

Using bot commands:

```dart
// Long way
teledart.onMessage(entityType: 'bot_command', keyword: 'start')
    .listen((message) => teledart.sendMessage(message.chat.id, 'Hello TeleDart!'));

// Short way (recommended)
teledart.onCommand('glory')
    .listen((message) => message.reply('to Ukraine!'));
```

Modifying [Stream](https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream):

```dart
teledart
    .onMessage(keyword: 'dart')
    .where((message) => message.text?.contains('telegram') ?? false)
    .listen((message) => message.replyPhoto(
        //  io.File('example/dash_paper_plane.png'),
        'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
        caption: 'This is how the Dart Bird and Telegram are met'));
```

[Inline mode](https://core.telegram.org/bots/api#inline-mode) example:

```dart
teledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
      InlineQueryResultArticle(
          id: 'ping',
          title: 'ping',
          inputMessageContent: InputTextMessageContent(
              messageText: '*pong*', parseMode: 'MarkdownV2')),
      InlineQueryResultArticle(
          id: 'ding',
          title: 'ding',
          inputMessageContent: InputTextMessageContent(
              messageText: '*_dong_*', parseMode: 'MarkdownV2')),
    ]));
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
