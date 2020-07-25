# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant messenger. 
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a [Dart](https://dart.dev) 
implementation of their [bot API](https://core.telegram.org/bots/api)
allowing you to create your own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-4.9-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.7-blue.svg?style=flat-square)](https://dart.dev)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)

## Usage

A simple usage example:

```dart
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  var teledart = TeleDart(Telegram('YOUR_BOT_TOKEN'), Event());

  teledart.start().then((me) => print('${me.username} is initialised'));

  teledart
      .onMessage(keyword: 'Fight for freedom')
      .listen((message) => message.replyMessage('Stand with Hong Kong'));
  
}
```

Modifying [Stream](https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream): 

```dart
teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text.contains('telegram'))
      .listen((message) => message.replyPhoto(
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how the Dart Bird and Telegram are met'));
```

[Inline mode](https://core.telegram.org/bots/api#inline-mode) example:

```dart
teledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
        InlineQueryResultArticle()
          ..id = 'ping'
          ..title = 'ping'
          ..input_message_content = (InputTextMessageContent()
            ..message_text = '*pong*'
            ..parse_mode = 'MarkdownV2'),
        InlineQueryResultArticle()
          ..id = 'ding'
          ..title = 'ding'
          ..input_message_content = (InputTextMessageContent()
            ..message_text = '_dong_'
            ..parse_mode = 'MarkdownV2')
      ]));
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
