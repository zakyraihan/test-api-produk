import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_api_paihsan/data/model/model.dart';

class AuthService {
  final _baseUrl = 'http://localhost:8080';

  Future registerProses(String nama, String email, String password) async {
    try {
      Uri urlData = Uri.parse('$_baseUrl/auth/register');

      Map data = {
        "nama": nama,
        "email": email,
        "password": password,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        Register dataResponse = registerFromJson(response.body.toString());
        return dataResponse;
      } else {
        return null;
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  Future loginProses(String email, String password) async {
    try {
      Uri urlData = Uri.parse('$_baseUrl/auth/login');

      Map data = {
        "email": email,
        "password": password,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        Login loginRes = loginFromJson(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('TOKEN', response.body);

        return loginRes;
      } else {
        throw Exception();
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  Future lupaPassword(
    String email,
  ) async {
    try {
      Uri urlData = Uri.parse('$_baseUrl/auth/lupa-password');

      Map data = {
        "email": email,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        ForgotPassword forgotRes = forgotPasswordFromJson(response.body);

        return forgotRes;
      } else {
        throw Exception();
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  Future resetPassword(
    String newPw,
  ) async {
    try {
      Uri urlData = Uri.parse(
          '$_baseUrl/auth/reset-password/5/f2e392a4f2a9ce0a098fbc149b722469fc4db62dabfd5c9eacce7dbed91c9265');

      Map data = {
        'new_password': newPw,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        ResetPassword resetRes = resetPasswordFromJson(response.body);

        return resetRes;
      } else {
        throw Exception();
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  void logOut(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('TOKEN');

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
