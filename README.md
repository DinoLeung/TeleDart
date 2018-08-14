# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant messenger. 
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a [Dart](https://www.dartlang.org/) 
implementation of their [bot API](https://core.telegram.org/bots/api)
allowing you to create your own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-v3.6-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.0.0-blue.svg?style=flat-square)](https://www.dartlang.org/dart-2)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
## Features

* Fully support [Telegram Bot API 3.6](https://core.telegram.org/bots/api#february-13-2018)
* [Inline mode](https://core.telegram.org/bots/api#inline-mode)
* [Telegram Payment Platform](https://telegram.org/blog/payments)
* [HTML5 Games](https://core.telegram.org/bots/api#games)
* [Dart 2](https://www.dartlang.org/dart-2) ready!!!

## Usage

A simple usage example:

```
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  TeleDart teledart = new TeleDart(new Telegram('YOUR_BOT_TOKEN'), new Event());

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
      .where((Message message) => message.text.contains('telegram'))
      .listen((message) {
    teledart.replyPhoto(
        message,
        'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.png',
        caption: 'This is how the Dart Bird and Telegram are met');
  });
```

[Inline mode](https://core.telegram.org/bots/api#inline-mode) example:

```
teledart.onInlineQuery().listen((inlineQuery) {
    List<InlineQueryResult> results = [
      new InlineQueryResultArticle()
        ..id = 'ping'
        ..title = 'ping'
        ..input_message_content = (new InputTextMessageContent()
          ..message_text = '*pong*'
          ..parse_mode = 'markdown'),
      new InlineQueryResultArticle()
        ..id = 'ding'
        ..title = 'ding'
        ..input_message_content = (new InputTextMessageContent()
          ..message_text = '_dong_'
          ..parse_mode = 'markdown')
    ];
    teledart.answerInlineQuery(inlineQuery, results);
  });
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
