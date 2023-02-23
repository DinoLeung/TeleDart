/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2019  Dino PH Leung
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/// Easy to use framework for building Telegram bots
///
/// This is the main library that is used for creating Telegram
/// bots. In most cases, you only need to use the [TeleDart]
/// class, since it's basically a wrapper around the other classes.
/// The other classes should only be manually used if you want to override
/// their default constructors (For example, change [LongPolling] settings
/// or use a [Webhook] instead of long polling).
library teledart;

export 'src/teledart/teledart.dart';
export 'src/teledart/event/event.dart';
export 'src/teledart/fetch/abstract_update_fetcher.dart';
export 'src/teledart/fetch/long_polling.dart';
export 'src/teledart/fetch/webhook.dart';
export 'src/util/http_client.dart';
