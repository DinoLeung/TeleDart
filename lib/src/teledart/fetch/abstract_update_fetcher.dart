/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2020  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';
import '../../telegram/model.dart';

abstract class AbstractUpdateFetcher {
  final StreamController<Update> _updateStreamController;

  AbstractUpdateFetcher() : _updateStreamController = StreamController();

  /// Add [update] to the stream.
  void emitUpdate(Update update) => _updateStreamController.add(update);

  /// When [update] is added to stream.
  Stream<Update> onUpdate() => _updateStreamController.stream;

  /// Starts fetching updates.
  Future<void> start();

  /// Stops fetching updates.
  Future<void> stop();
}
