# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant messenger. 
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a [Dart](https://www.dartlang.org/) 
implementation of their [bot API](https://core.telegram.org/bots/api)
allowing you to create your own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-4.2-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.2-blue.svg?style=flat-square)](https://www.dartlang.org/dart-2)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
## Features

* Fully support [Telegram Bot API 4.2](https://core.telegram.org/bots/api#april-14-2019)
* [Inline mode](https://telegram.org/blog/inline-bots)
* [Telegram Payment Platform](https://telegram.org/blog/payments)
* [Telegram Passport](https://telegram.org/blog/passport)
* [Gaming Platform](https://telegram.org/blog/games)
* [Dart 2](https://www.dartlang.org/dart-2) ready!!!

## Usage

A simple usage example:

```
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  TeleDart teledart = TeleDart(Telegram('YOUR_BOT_TOKEN'), Event());

  teledart.startFetching();

  teledart
        .onCommand('hello')
        .listen(((message) => teledart.replyMessage(message, 'world')));
}
```

Modifying [Stream](https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream): 

```
teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text.contains('telegram'))
      .listen((message) => teledart.replyPhoto(
          message,
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how the Dart Bird and Telegram are met'));
```

[Inline mode](https://core.telegram.org/bots/api#inline-mode) example:

```
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
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
