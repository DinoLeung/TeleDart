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

import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';

import '../../telegram/telegram.dart';
import '../../telegram/model.dart';
import 'abstract_update_fetcher.dart';

/// Update fetcher which uses the webhook method.
///
/// To learn how to use it instead of long polling,
/// see [TeleDart.start] documentation.
class Webhook extends AbstractUpdateFetcher {
  final Telegram telegram;

  final io.HttpServer _server;

  String url;
  String? ipAddress;
  int port;
  int? serverPort;
  int maxConnections;
  List<String>? allowedUpdates;
  bool? dropPendingUpdates;
  String? secretToken;

  io.File? certificate;
  io.File? privateKey;
  bool uploadCertificate;

  /// Setup webhook
  ///
  /// Webhook server listens to [port] by default, set [serverPort] to override.
  ///
  /// Set [url] as host name e.g. `https://example.com`.
  ///
  /// Default [port] is `443`, Telegram API supports `443`, `80`, `88`, `8443`.
  /// Provide [privateKey] and [certificate] pair for HTTPS configuration
  ///
  /// Throws [WebhookException] if [port] is not supported by Telegram
  /// or [maxConnections] is less than 1 or greater than 100.
  Webhook(this.telegram, this.url, this._server,
      {this.ipAddress,
      this.certificate,
      this.privateKey,
      this.port = 443,
      this.serverPort,
      this.uploadCertificate = false,
      this.maxConnections = 40,
      this.allowedUpdates,
      this.dropPendingUpdates,
      this.secretToken}) {
    if (![443, 80, 88, 8443].contains(port)) {
      throw WebhookException(
          'Ports currently supported for Webhooks: 443, 80, 88, 8443.');
    }
    if (maxConnections > 100 || maxConnections < 1) {
      throw WebhookException('Connection limit must between 1 and 100.');
    }
  }

  static Future<Webhook> createHttpWebhok(Telegram telegram, String url,
      {String? ipAddress,
      int port = 80,
      int? serverPort,
      int maxConnections = 40,
      List<String>? allowedUpdates,
      bool? dropPendingUpdates,
      String? secretToken}) async {
    var server = await io.HttpServer.bind(
        io.InternetAddress.anyIPv4.address, serverPort ?? port);
    return Webhook(telegram, url, server,
        ipAddress: ipAddress,
        port: port,
        serverPort: serverPort,
        maxConnections: maxConnections,
        allowedUpdates: allowedUpdates,
        secretToken: secretToken);
  }

  static Future<Webhook> createHttpsWebhok(
      Telegram telegram, String url, io.File certificate, io.File privateKey,
      {String? ipAddress,
      int port = 80,
      int? serverPort,
      bool uploadCertificate = false,
      int maxConnections = 40,
      List<String>? allowedUpdates,
      bool? dropPendingUpdates,
      String? secretToken}) async {
    var server = await io.HttpServer.bindSecure(
        io.InternetAddress.anyIPv4.address,
        serverPort ?? port,
        io.SecurityContext()
          ..useCertificateChainBytes(certificate.readAsBytesSync())
          ..usePrivateKeyBytes(privateKey.readAsBytesSync()));
    return Webhook(telegram, url, server,
        ipAddress: ipAddress,
        certificate: certificate,
        privateKey: privateKey,
        port: port,
        serverPort: serverPort,
        uploadCertificate: uploadCertificate,
        maxConnections: maxConnections,
        allowedUpdates: allowedUpdates,
        secretToken: secretToken);
  }

  Future<bool> setWebhook() async => await telegram.setWebhook('$url:$port',
      ipAddress: ipAddress,
      certificate: uploadCertificate ? certificate : null,
      maxConnections: maxConnections,
      allowedUpdates: allowedUpdates,
      dropPendingUpdates: dropPendingUpdates,
      secretToken: secretToken);

  /// Apply webhook configuration on Telegram API, and start the webhook server.
  @override
  Future<void> start() async {
    if (await setWebhook()) {
      _server.listen((io.HttpRequest request) {
        var isPostRequest = request.method == 'POST';
        var isAuthorised = secretToken == null ||
            secretToken ==
                request.headers.value('X-Telegram-Bot-Api-Secret-Token');

        if (isPostRequest && isAuthorised) {
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
    } else {
      throw WebhookException(
          'Telegram API returns an error while attempting to set the webhook.');
    }
  }

  /// Remove webhook configuration from Telegram API, and stop the webhook server.
  @override
  Future<void> stop({bool? dropPendingUpdates}) async {
    await telegram.deleteWebhook(dropPendingUpdates: dropPendingUpdates);
    return _server.close();
  }
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  @override
  String toString() => 'WebhookException: $cause';
}
