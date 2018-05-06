import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

import 'package:TeleDart/src/Model.dart';

class TeleDart {

  final String _baseUrl = 'https://api.telegram.org/bot';
  String _token;
  TeleDart(this._token);

  var dson = new Dartson.JSON();

  Future<List<Update>> getUpdates() async {

    Future<List<Update>> updates = http.get(_baseUrl + _token + '/getUpdates')
      .then((response) {
        return dson.map
          (JSON.decode(response.body)['result'], new Update(), true);
      });

    return await updates;
  }

  void startPolling() {
    Future<List<Update>> updates = getUpdates();
    updates.then((updates) {
      for (Update update in updates){
        print(update.update_id);
      }
    });
  }

}