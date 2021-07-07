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
import 'abstract_update_fetcher.dart';

class Webhook extends AbstractUpdateFetcher {
  final Telegram telegram;

  io.HttpServer _server;

  String url;
  String? ip_address;
  String secretPath;
  int port;
  int? serverPort;
  int max_connections;
  List<String>? allowed_updates;
  bool? drop_pending_updates;

  io.File? certificate;
  io.File? privateKey;
  bool uploadCertificate;

  /// Setup webhook
  ///
  /// Webhook server listens to [port] by default, set [serverPort] to override.
  ///
  /// Set [url] as host name e.g. `https://example.com`, suggested to use bot tokan as [secretPath].
  ///
  /// Default [port] is `443`, Telegram API supports `443`, `80`, `88`, `8443`.
  /// Provide [privateKey] and [certificate] pair for HTTPS configuration
  ///
  /// Throws [WebhookException] if [port] is not supported by Telegram
  /// or [max_connections] is less than 1 or greater than 100.
  Webhook(this.telegram, this.url, this.secretPath, this._server,
      {this.ip_address,
      this.certificate,
      this.privateKey,
      this.port = 443,
      this.serverPort,
      this.uploadCertificate = false,
      this.max_connections = 40,
      this.allowed_updates,
      this.drop_pending_updates}) {
    if (![443, 80, 88, 8443].contains(port)) {
      throw WebhookException(
          'Ports currently supported for Webhooks: 443, 80, 88, 8443.');
    }
    if (max_connections > 100 || max_connections < 1) {
      throw WebhookException('Connection limit must between 1 and 100.');
    }

    // prefix url and secret path
    if (url.endsWith('\/')) url.substring(0, url.length - 1);
    if (!secretPath.startsWith('\/')) {
      secretPath = '\/' + secretPath;
    }
  }

  static Future<Webhook> createHttpWebhok(
      Telegram telegram, String url, String secretPath,
      {String? ip_address,
      int port = 80,
      int? serverPort,
      int max_connections = 40,
      List<String>? allowed_updates,
      bool? drop_pending_updates}) async {
    var server = await io.HttpServer.bind(
        io.InternetAddress.anyIPv4.address, serverPort ?? port);
    return Webhook(telegram, url, secretPath, server,
        ip_address: ip_address,
        port: port,
        serverPort: serverPort,
        max_connections: max_connections,
        allowed_updates: allowed_updates);
  }

  static Future<Webhook> createHttpsWebhok(Telegram telegram, String url,
      String secretPath, io.File certificate, io.File privateKey,
      {String? ip_address,
      int port = 80,
      int? serverPort,
      bool uploadCertificate = false,
      int max_connections = 40,
      List<String>? allowed_updates,
      bool? drop_pending_updates}) async {
    var server = await io.HttpServer.bindSecure(
          io.InternetAddress.anyIPv4.address,
          serverPort ?? port,
          io.SecurityContext()
            ..useCertificateChainBytes(certificate.readAsBytesSync())
            ..usePrivateKeyBytes(privateKey.readAsBytesSync()));
    return Webhook(telegram, url, secretPath, server,
        ip_address: ip_address,
        certificate: certificate,
        privateKey: privateKey,
        port: port,
        serverPort: serverPort,
        uploadCertificate: uploadCertificate,
        max_connections: max_connections,
        allowed_updates: allowed_updates);
  }

  Future<void> setWebhook() async {
    await telegram.setWebhook('$url:$port$secretPath',
        ip_address: ip_address,
        certificate: uploadCertificate ? certificate : null,
        max_connections: max_connections,
        allowed_updates: allowed_updates,
        drop_pending_updates: drop_pending_updates);
  }

  /// Apply webhook configuration on Telegram API, and start the webhook server.
  @override
  Future<void> start() async {
    await setWebhook();

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
    });
  }

  /// Remove webhook configuration from Telegram API, and stop the webhook server.
  @override
  Future<void> stop({bool? drop_pending_updates}) async {
    await telegram.deleteWebhook(drop_pending_updates: drop_pending_updates);
    return _server.close() ?? Future.value();
  }
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  @override
  String toString() => 'WebhookException: $cause';
}
