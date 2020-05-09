/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
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
import 'dart:io' as io;
import 'dart:convert';

import '../../telegram/telegram.dart';
import '../../telegram/model.dart';

class Webhook {
  final Telegram telegram;

  io.HttpServer _server;
  io.SecurityContext _context;

  String url;
  String secretPath;
  int port;
  int max_connections;
  List<String> allowed_updates;

  io.File certificate;
  io.File privateKey;
  bool uploadCertificate;

  StreamController<Update> _updateStreamController;

  /// Setup webhook
  ///
  /// Throws [WebhookException] if [port] is not supported by Telegram
  /// or [max_connections] is less than 1 or greater than 100.
  Webhook(this.telegram, this.url, this.secretPath, this.certificate,
      this.privateKey,
      {this.port = 443,
      this.uploadCertificate = false,
      this.max_connections = 40,
      this.allowed_updates}) {
    if (![443, 80, 88, 8443].contains(port)) {
      throw WebhookException(
          'Ports currently supported for Webhooks: 443, 80, 88, 8443.');
    }
    if (max_connections > 100 || max_connections < 1) {
      throw WebhookException('Connection limit must between 1 and 100.');
    }

    _updateStreamController = StreamController();

    // prefix url and secret path
    if (url.endsWith('\/')) url.substring(0, url.length - 1);
    if (!secretPath.startsWith('\/')) {
      secretPath = '\/' + secretPath;
    }

    // serup SecurityContext
    _context = io.SecurityContext();
    _context.useCertificateChainBytes(certificate.readAsBytesSync());
    _context.usePrivateKeyBytes(privateKey.readAsBytesSync());
  }

  /// Set webhook on telegram server.
  Future<void> setWebhook() async {
    Future<dynamic> serverFuture = io.HttpServer.bindSecure(
        io.InternetAddress.anyIPv4.address, port, _context);

    await serverFuture.then((server) => _server = server).then((_) {
      telegram.setWebhook('${url}:${port}${secretPath}',
          certificate: uploadCertificate ? certificate : null,
          max_connections: max_connections,
          allowed_updates: allowed_updates);
    }).catchError((error) => Future.error(WebhookException(error.toString())));
  }

  /// Start the webhook.
  Future<void> startWebhook() async {
    if (_server == null) {
      throw WebhookException(
          'Please use setWebhook() to initialise webhook before start webhook.');
    }
    _server.listen((io.HttpRequest request) {
      if (request.method == 'POST' && request.uri.path == secretPath) {
        request.cast<List<int>>().transform(utf8.decoder).join().then((data) {
          emitUpdate(Update.fromJson(jsonDecode(data)));
          request.response
            ..write(jsonEncode({'ok': true}))
            ..close();
        });
      } else {
        request.response
          ..statusCode = io.HttpStatus.methodNotAllowed
          ..write(jsonEncode({'ok': false}))
          ..close();
      }
    }).onError((error) => Future.error(WebhookException(error.toString())));
  }

  /// Remove webhook from telegram server
  Future<void> deleteWebhook() async {
    await telegram.deleteWebhook().catchError(
        (error) => Future.error(WebhookException(error.toString())));
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
  @override
  String toString() => 'WebhookException: ${cause}';
}
