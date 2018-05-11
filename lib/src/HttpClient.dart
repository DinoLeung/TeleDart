import 'dart:async';
import 'dart:convert';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  final _dson = new Dartson.JSON();

  Future httpGet(String url, {Object returnType, bool isList}) async {
    return http.get(url)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0)
        return returnType != null ?
            _dson.map(JSON.decode(response.body)['result'], returnType, isList) :
            JSON.decode(response.body)['result'];
      else
        return new Future.error('HttpClient Error: ${response.statusCode} ${response.reasonPhrase}');
    })
        .catchError((error) {
      return new Future.error(error);
    });
  }

  Future httpPost(String url, {Map body, Object returnType, bool isList, String jsonItem}) async {
    return http.post(url,
        body: body)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 0) {
        dynamic json = (jsonItem == null ?
            JSON.decode(response.body)['result'] :
            JSON.decode(response.body)['result'][jsonItem]);
        return returnType != null ?
            _dson.map(json, returnType, isList) :
            json;
      }
      else
        return new Future.error('HttpClient Error: ${response.statusCode} ${response.reasonPhrase}');
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
          if (response.statusCode == 200 || response.statusCode == 0) {
            dynamic json = (jsonItem == null ?
                JSON.decode(response.body)['result'] :
                JSON.decode(response.body)['result'][jsonItem]);
            return returnType != null ?
                _dson.map(json, returnType, isList) :
                json;
          }
          else
            return new Future.error('HttpClient Error: ${response.statusCode} ${response.reasonPhrase}');
        })
        .catchError((error) {
          return new Future.error(error);
        });
  }

}