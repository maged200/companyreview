import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:m7laty/environment/environment.dart';
// but it's the only option during project creation, must be replaced later

class ApiClient {
  static Client _client = Client();
  static String _baseUrl = Environment.apiUrl;
  static Map<String, String> _createHeader({String token}) {
    final _header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (!(token?.trim()?.isEmpty ?? true))
      _header.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $token');
    return _header;
  }

  static dynamic _toJson(dynamic body) {
    try {
      return body.toJson();
    } catch (NoSuchMethodError) {
      return body;
    }
  }

  static Future<dynamic> _createRequest(
      {@required RequestType type,
      @required String path,
      @required String token,
      @required BuildContext context,
      dynamic body}) async {
    String _body;
    if (body != null) _body = jsonEncode(_toJson(body));
    final Uri _path = Uri.parse("$_baseUrl$path");
    final Map<String, String> _headers = _createHeader(token: token);
    var response;
    try {
      switch (type) {
        case RequestType.GET:
          response = await _client.get(
            _path,
            headers: _headers,
          );
          break;
        case RequestType.POST:
          response = await _client.post(
            _path,
            body: _body,
            headers: _headers,
          );
          break;
        case RequestType.PUT:
          response = await _client.put(
            _path,
            body: _body,
            headers: _headers,
          );
          break;
        case RequestType.DELETE:
          response = await _client.delete(
            _path,
            headers: _headers,
          );
          break;
        default:
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    checkAuthorization(context: context, response: response);
    return response;
  }

  static Future<dynamic> getRequest(
      {String path, String token, @required BuildContext context}) async {
    return await _createRequest(
      token: token,
      type: RequestType.GET,
      path: path,
      context: context,
    );
  }

  static Future<dynamic> postRequest(
      {dynamic body,
      String path,
      String token,
      @required BuildContext context}) async {
    return await _createRequest(
      token: token,
      type: RequestType.POST,
      path: path,
      context: context,
      body: body,
    );
  }

  static Future<dynamic> putRequest(
      {dynamic body,
      String path,
      String token,
      @required BuildContext context}) async {
    return await _createRequest(
      token: token,
      type: RequestType.PUT,
      path: path,
      context: context,
      body: body,
    );
  }

  static Future<dynamic> deleteRequest(
      {String path, String token, @required BuildContext context}) async {
    return await _createRequest(
      token: token,
      type: RequestType.DELETE,
      path: path,
      context: context,
    );
  }

  static login(
      {@required dynamic body,
      @required Uri path,
      @required BuildContext context}) {
    return _client.post(
      path,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
  }

  static checkAuthorization(
      {dynamic response, @required BuildContext context}) async {
    if (response?.statusCode == 401) {}
  }
}

enum RequestType { GET, POST, PUT, DELETE, FILE, BASE64STRING }
