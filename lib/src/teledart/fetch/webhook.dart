/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2018  Dino PH Leung
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

import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';

import '../../telegram/telegram.dart';
import '../../telegram/model.dart';

class Webhook {
  final Telegram telegram;

  io.HttpServer _server;
  io.SecurityContext _context;

  String url;
  io.File certificate;
  int max_connections;
  List<String> allowed_updates;

  String secretPath;
  int port;
  io.File privateKey;

  StreamController<Update> _updateStreamController;

  /// Setup webhook
  ///
  /// Throws [WebhookException] if [port] is not supported by Telegram
  /// or [max_connections] is less than 1 or greater than 100.
  Webhook(this.telegram, this.url, this.secretPath,
      {this.port = 443,
      this.privateKey,
      this.certificate,
      this.max_connections = 40,
      this.allowed_updates}) {
    if (![443, 80, 88, 8443].contains(this.port))
      throw new WebhookException(
          'Ports currently supported for Webhooks: 443, 80, 88, 8443.');
    if (max_connections > 100 || max_connections < 1)
      throw new WebhookException('Connection limit must between 1 and 100.');

    _updateStreamController = new StreamController();

    // prefix url and secret path
    if (this.url.endsWith('\/')) this.url.substring(0, this.url.length - 1);
    if (!this.secretPath.startsWith('\/'))
      this.secretPath = '\/' + this.secretPath;

    // serup SecurityContext
    if (privateKey != null && certificate != null) {
      _context = new io.SecurityContext();
      _context.usePrivateKeyBytes(privateKey.readAsBytesSync());
      _context.useCertificateChainBytes(certificate.readAsBytesSync());
    }
  }

  /// Set webhook on telegram server.
  Future<void> setWebhook() async {
    // initialise server
    Future<dynamic> serverFuture = _context == null
        ? io.HttpServer.bind(io.InternetAddress.loopbackIPv4.address, port)
        : io.HttpServer.bindSecure(
            io.InternetAddress.loopbackIPv4.address, port, _context);

    await serverFuture.then((server) => _server = server).then((_) {
      telegram.setWebhook('${this.url}:${this.port}${this.secretPath}',
          certificate: certificate,
          max_connections: max_connections,
          allowed_updates: allowed_updates);
    }).catchError(
        (error) => new Future.error(new WebhookException(error.toString())));
  }

  /// Start the webhook.
  Future<void> startWebhook() async {
    if (_server == null)
      throw new WebhookException(
          'Please use setWebhook() to initialise webhook before start webhook.');
    _server.listen((io.HttpRequest request) {
      if (request.method == 'POST' && request.uri.path == this.secretPath) {
        request
            .transform(utf8.decoder)
            .join()
            .then((data) => emitUpdate(new Update.fromJson(jsonDecode(data))));
        request.response.write({'ok': true});
      } else {
        request.response.statusCode = io.HttpStatus.methodNotAllowed;
        request.response.write({'ok': false});
      }
      request.response.close();
    }).onError(
        (error) => new Future.error(new WebhookException(error.toString())));
  }

  /// Remove webhook from telegram server
  Future<void> deleteWebhook() async {
    await telegram.deleteWebhook().catchError(
        (error) => new Future.error(new WebhookException(error.toString())));
  }

  /// Stop the webhook
  void stopWebhook() {
    if (_server != null) _server.close();
  }

  /// Add [update] to the stream.
  void emitUpdate(Update update) => _updateStreamController.add(update);

  /// When [update] is added to stream.
  Stream<Update> onUpdate() => _updateStreamController.stream;
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  String toString() => 'WebhookException: ${cause}';
}
