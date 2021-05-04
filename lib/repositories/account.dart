import 'dart:convert';
import 'package:bikesafe_mobile/models/is_auth_response.dart';
import 'package:bikesafe_mobile/models/login.dart';
import 'package:bikesafe_mobile/models/login_response.dart';
import 'package:bikesafe_mobile/models/profile_response.dart';
import 'package:bikesafe_mobile/models/register.dart';
import 'package:bikesafe_mobile/models/register_response.dart';
import 'package:http/http.dart' as http;

class AccountRepository {
  static String _baseUrl = "http://192.168.0.7:4004";
  static Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
  };
  static Future<LoginResponse> login(Login data) async {
    Map<String, dynamic> rawBody = data.toJson();
    var encodedBody = jsonEncode(rawBody);
    final response = await http.post("$_baseUrl/login",
        headers: _defaultHeaders, body: encodedBody);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      throw Exception('Failed to load Json');
    }
  }

  static Future<RegisterResponse> register(Register data) async {
    Map<String, dynamic> rawBody = data.toJson();
    var encodedBody = jsonEncode(rawBody);
    final response = await http.post("$_baseUrl/register",
        headers: _defaultHeaders, body: encodedBody);
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Json');
    }
  }

  static Future<bool> logout(String token) async {
    _defaultHeaders['authorization'] = "bearer $token";
    final response =
        await http.post("$_baseUrl/logout", headers: _defaultHeaders);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load Json');
    }
  }

  static Future<ProfileResponse> fetchProfile(String token) async {
    _defaultHeaders['Authorization'] = "Bearer $token";
    print("bearer $token");
    final response =
        await http.get("$_baseUrl/profile", headers: _defaultHeaders);
    if (response.statusCode == 200) {
      print(response.body);
      return ProfileResponse.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      throw Exception('Failed to load Json');
    }
  }

  static Future<IsAuthResponse> isAuth(String token) async {
    _defaultHeaders['authorization'] = "bearer $token";
    final response =
        await http.get("$_baseUrl/isauth", headers: _defaultHeaders);
    if (response.statusCode == 200) {
      return IsAuthResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Json');
    }
  }
}
