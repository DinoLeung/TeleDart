# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant messenger.
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a [Dart](https://dart.dev)
implementation of their [bot API](https://core.telegram.org/bots/api)
allowing you to create your own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-5.7-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.14-blue.svg?style=flat-square)](https://dart.dev)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)

## Creating a Telegram bot

In order to create a Telegram bot, you need to use [@BotFather](https://t.me/botfather).
Follow the instructions in BotFather, then copy your bot token and you're ready to go.

## Usage

Initializing the bot:

```dart
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() {
  var BOT_TOKEN = 'YOUR_BOT_TOKEN_FROM_BOT_FATHER';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));

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
          input_message_content: InputTextMessageContent(
              message_text: '*pong*', parse_mode: 'MarkdownV2')),
      InlineQueryResultArticle(
          id: 'ding',
          title: 'ding',
          input_message_content: InputTextMessageContent(
              message_text: '*_dong_*', parse_mode: 'MarkdownV2')),
    ]));
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
