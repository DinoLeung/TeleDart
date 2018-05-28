# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant messenger. 
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a Dart implementation of their [bot API](https://core.telegram.org/bots/api)
allowing you to create your own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-v3.6-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-v1.24.3-blue.svg?style=flat-square)](https://www.dartlang.org/guides/get-started)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
## Features

* Fully support [Telegram Bot API 3.6](https://core.telegram.org/bots/api#february-13-2018)
* [Inline mode](https://core.telegram.org/bots/api#inline-mode)
* [Telegram Payment Platform](https://telegram.org/blog/payments)
* [HTML5 Games](https://core.telegram.org/bots/api#games)

## Usage

A simple usage example:

```
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

```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
