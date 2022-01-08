/**
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

/// Various models used by TeleDart
///
/// All types used in the Bot API responses are represented as JSON-objects.
/// It is safe to use 32-bit signed integers for storing all __Integer__ fields unless otherwise noted.
///
/// __Optional__ fields may be not returned when irrelevant.
///
/// https://core.telegram.org/bots/api#available-types
library model;

export 'src/telegram/model.dart';
export 'src/teledart/model/callback_query.dart';
export 'src/teledart/model/inline_query.dart';
export 'src/teledart/model/message.dart';
export 'src/teledart/model/pre_checkout_query.dart';
export 'src/teledart/model/shipping_query.dart';
