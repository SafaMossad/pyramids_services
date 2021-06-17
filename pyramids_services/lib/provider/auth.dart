import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pyramidsservices/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse("https://pyramids-services.herokuapp.com//api/v1/sessions");
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = json.encode({"email": "$email", "password": "$password"});
    try {
      // make POST request
      final response = await http.post(url, headers: headers, body: body);

      var data = json.decode(response.body);
      print("API Response=> $data");

      if (data['errors'] != null) {
        throw HttpException(data['errors']);
      }
      _token = data["auth_token"];
      _userId = data['id'].toString();
      // _userName=data["email"].toString();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          //'email':_userName,
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      print(" Caught error=> $error");
      throw error;
    }
  }

  Future<void> signUp(String name,String email, String password, String phone) async {
    Uri url = Uri.parse("https://pyramids-services.herokuapp.com//api/v1/users");
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = json.encode({
      "user":
      {
        "email": "$email",
        "name": "$name",
        "password": "$password",
        "password_confirmation": "$password",
        "phone": "$phone"
      }
    });

    try {
      // make POST request
      final response = await http.post(url, headers: headers, body: body);

      var data = json.decode(response.body);
      print("API Response=> $data");

      if (data['errors'] != null) {
        throw HttpException(data['errors']);
      }
      _token = data["auth_token"];
      _userId = data['id'].toString();
      // _userName=data["email"].toString();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          //'email':_userName,
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      print(" Caught error=> $error");
      throw error;
    }
  }


  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
    json.decode(prefs.getString('userData')) as Map<String, Object>;
    
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    notifyListeners();

    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.clear();
  }
}
