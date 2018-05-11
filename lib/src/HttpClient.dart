import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  final _dson = new Dartson.JSON();

  Future httpGet(String url, {Object returnType, bool isList}) async {
    return http.get(url)
        .then((response) {
          dynamic body = JSON.decode(response.body);
          if (body['ok'])
            return returnType != null ?
                _dson.map(body['result'], returnType, isList) :
                body['result'];
          else
            return new Future.error('HttpClient Error ${body['error_code']} ${body['description']}');
        })
        .catchError((error) {
      return new Future.error(error);
    });
  }

  Future httpPost(String url, {Map body, Object returnType, bool isList, String jsonItem}) async {
    return http.post(url,
        body: body)
        .then((response) {
          dynamic body = JSON.decode(response.body);
          if (body['ok']) {
            dynamic json = (jsonItem == null ?
                body['result'] :
                body['result'][jsonItem]);
            return returnType != null ?
                _dson.map(json, returnType, isList) :
                json;
          }
          else
            return new Future.error('HttpClient Error ${body['error_code']} ${body['description']}');
        })
        .catchError((error) {
      return new Future.error(error);
    });
  }

  Future httpMultipartPost(String url, http.MultipartFile file,
      {Map body, Object returnType, bool isList, String jsonItem}) async {
    http.MultipartRequest request = new http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll({'Content-Type': 'multipart/form-data'})
      ..fields.addAll(body)
      ..files.add(file);
    return request.send()
        .then((response) =>
            http.Response.fromStream(response))
        .then((response) {
          dynamic body = JSON.decode(response.body);
          if (body['ok']) {
            dynamic json = (jsonItem == null ?
                body['result'] :
                body['result'][jsonItem]);
            return returnType != null ?
                _dson.map(json, returnType, isList) :
                json;
          }
          else
            return new Future.error('HttpClient Error ${body['error_code']} ${body['description']}');
        })
        .catchError((error) {
          return new Future.error(error);
        });
  }

}