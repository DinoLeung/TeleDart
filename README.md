# TeleDart

[Telegram](https://telegram.org/) is a popular secured instant online messenger. 
They have an open [bot platform](https://telegram.org/blog/bot-revolution),
this package is a Dart implementation of their [API](https://core.telegram.org/bots/api)
allowing you to create own bot easily.

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-v3.6-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-v1.24.3-blue.svg?style=flat-square)](https://www.dartlang.org/guides/get-started)
[![License](https://img.shields.io/badge/Lcense-GNU-red.svg?style=flat-square)](https://github.com/DinoLeung/TeleDart/tree/master/LICENSE)

## Features

* Fully supported [Telegram Bot API 3.6](https://core.telegram.org/bots/api#february-13-2018)
* [Inline mode](https://core.telegram.org/bots/api#inline-mode)
* [Telegram Payment Platform](https://telegram.org/blog/payments)
* [HTML5 Games](https://core.telegram.org/bots/api#games)

## Usage

A simple usage example:

```
import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() {
  TeleDart teledart = new TeleDart(new Telegram('YOUR_BOT_TOKEN'), new Event());

  teledart.startFetching();

  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen((message) {
    teledart.telegram.sendMessage(message.from.id, 'Hello TeleDart!');
  });

  teledart.onMessage(keyword: 'TeleDart').listen((message) {
    teledart.telegram.sendPhoto(
        message.from.id,
        new io.File('example/dart_bird_catchs_telegram.png'),
        caption: 'This is how the Dart Bird and Telegram are met');
  });
}
```

## Bugs and feature requests

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DinoLeung/TeleDart/issues
