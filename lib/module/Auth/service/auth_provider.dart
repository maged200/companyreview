import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:m7laty/api/api_client.dart';
import 'package:m7laty/environment/environment.dart';
import 'package:m7laty/module/Auth/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String _token = "";
  Color _theamColor = Colors.black;
  UserData _userData;
  String _tokenKey = "#token";
  String _userDataKey = "#userdata";
  bool _isLogged = false;
  bool _notification = false;
  Color get theamColor => _theamColor;

  String get token => this._token;
  bool get isLogged => this._isLogged;
  UserData get userData => this._userData;
  bool get notification => this._notification;

  set token(String tokenString) {
    this._token = tokenString ?? '';
    if (this._token.isEmpty)
      this._isLogged = false;
    else {
      this._isLogged = true;
      this.setAuthTokenInStorage(this._token);
    }
    notifyListeners();
  }

  changeNotification(bool change) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('changeNotification', change);
  }

  Future<bool> getNotificationLastCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('changeNotification');
  }

  set userData(UserData userData) {
    this._userData = userData;
    setUserDataInStorage(userData);
    notifyListeners();
  }

  Future logout() async {
    this._token = '';
    this._isLogged = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(this._tokenKey);
    notifyListeners();
    return;
  }

  Future<void> setAuthTokenInStorage(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this._tokenKey, token);
  }

  Future<void> setUserDataInStorage(UserData userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this._userDataKey, json.encode(userData.toJson()));
  }

  Future<String> getAuthTokenFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? '';
  }

  Future<UserData> getAuthUserDataFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = prefs.getString(_userDataKey);
    if (temp == null || temp.isEmpty) return null;
    return UserData.fromJson(jsonDecode(prefs.getString(_userDataKey)));
  }

  Future<bool> checkAuthTokenInStorage({@required BuildContext context}) async {
    if (this._isLogged) return true;
    String token = await getAuthTokenFromStorage();
    if (token.isNotEmpty) {
      this._isLogged = true;
      this._token = token;
    } else {
      this._isLogged = false;
    }

    print('Stored >>> ' + token + "   >>> " + this._isLogged.toString());
    return this._isLogged;
  }

  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }

  Future<bool> login({LoginBody body, @required BuildContext context}) async {
    UserLoginResponse loginResponse = new UserLoginResponse();
    var response = await ApiClient.login(
        body: body,
        path: Uri.parse("${Environment.apiUrl}user-management/Auth/login/"),
        context: context);
    if (response.statusCode == 200) {
      print("login response ===>>>>> ${jsonDecode(response.body)}");

      loginResponse = UserLoginResponse.fromJson(jsonDecode(response.body));
      this.token = loginResponse.token;
    } else {
      print("login response ===>>>>> ${response.statusCode}");
      return false;
    }

    return true;
  }
}

class UserLoginResponse {
  int id;
  String name;
  String token;
  List<String> roles;

  UserLoginResponse({this.id, this.name, this.token, this.roles});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }
}
