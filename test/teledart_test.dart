import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:test/test.dart';

void main() {
  TeleDart teleDart = TeleDart(
    Platform.environment["BOT_TOKEN"]!,
    Event(Platform.environment["BOT_USERNAME"] ?? ""),
  );
  group('Senders', () {
    setUp(() {});

    test('sendMessage', () async {
      final msg = await teleDart.sendMessage(
        Platform.environment["CHAT_ID"]!,
        "Hello World!",
      );
      expect(msg.text, "Hello World!");
    });
  });
}
