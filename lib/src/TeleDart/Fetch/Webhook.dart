import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';

import 'package:dartson/dartson.dart';
import 'package:TeleDart/src/Telegram/Telegram.dart';
import 'package:TeleDart/src/Telegram/Model.dart';

class Webhook {

  final _dson = new Dartson.JSON();

  Telegram telegram;

  io.HttpServer _server;
  io.SecurityContext _context;

  String url;
  io.File certificate;
  int max_connections;
  List<String> allowed_updates;

  String secretPath;
  int port;
  io.File privateKey;

  StreamController _updateStreamController;

  Webhook(this.telegram, this.url, this.secretPath,
      {this.port: 443, this.privateKey, this.certificate,
        this.max_connections: 40, this.allowed_updates}) {
    _updateStreamController = new StreamController();
    // prefix url and secret path
    if(this.url.endsWith('\/'))
      this.url.substring(0, this.url.length -1);
    if(!this.secretPath.startsWith('\/'))
      this.secretPath = '\/' + this.secretPath;

  }

  void setWebhook() {

    if(privateKey != null && certificate != null) {
      _context = new io.SecurityContext();
      _context.usePrivateKeyBytes(privateKey.readAsBytesSync());
      _context.useCertificateChainBytes(certificate.readAsBytesSync());
    }

    // initialise server
    Future serverFuture = _context == null ?
    io.HttpServer.bind(io.InternetAddress.LOOPBACK_IP_V4.address, port) :
    io.HttpServer.bindSecure(io.InternetAddress.LOOPBACK_IP_V4.address, port, _context);

    serverFuture.then((server) => _server = server)
    .then((_) {
      telegram.setWebhook('${this.url}:${this.port}${this.secretPath}',
          certificate: certificate, max_connections: max_connections,
          allowed_updates: allowed_updates);
    })
    .catchError((error) =>
        new Future.error(new WebhookException(error.toString())));

  }

  void startWebhook() {
    _server.listen((io.HttpRequest request) {
      if(request.method == 'POST' &&
          request.uri.path == this.secretPath ) {
        request.transform(UTF8.decoder).join().then((data) {
          emitUpdate(_dson.map(JSON.decode(data), new Update(), true));
        });
        request.response.write('ok');
        request.response.close();
      }
      else {
      request.response
        ..statusCode = io.HttpStatus.METHOD_NOT_ALLOWED;
      }
      request.response.close();
    });
  }

  Future deleteWebhook() async {
    telegram.deleteWebhook()
        .catchError((error) =>
            new Future.error(new WebhookException(error.toString())));
  }

  void stopWebhook() =>
      _server.close();

  void emitUpdate(Update update) =>
      _updateStreamController.add(update);

  Stream<Update> onUpdate() =>
      _updateStreamController.stream;
}

class WebhookException implements Exception {
  String cause;
  WebhookException(this.cause);
  String toString() => 'WebhookException: ${cause}';
}