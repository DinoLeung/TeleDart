# TeleDart

A easy to use Telegram bot API framework in Dart

![TeleDart](https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dart_bird_catchs_telegram.svg?sanitize=true)

[![Bot API Version](https://img.shields.io/badge/Bot%20API-v3.6-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-v1.24.3-blue.svg?style=flat-square)](https://www.dartlang.org/guides/get-started)
[![License](https://img.shields.io/badge/Lcense-GNU-red.svg?style=flat-square)](https://github.com/DinoLeung/TeleDart/tree/master/LICENSE)


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
