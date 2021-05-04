import 'dart:convert';
import 'package:bikesafe_mobile/models/is_auth_response.dart';
import 'package:bikesafe_mobile/models/login.dart';
import 'package:bikesafe_mobile/models/login_response.dart';
import 'package:bikesafe_mobile/models/profileResponse.dart';
import 'package:bikesafe_mobile/models/register.dart';
import 'package:bikesafe_mobile/models/register_response.dart';
import 'package:http/http.dart' as http;

class AccountRepository{
  static String baseUrl = "http://172.17.197.225:4004";
  static Map<String, String> defaultHeaders = {
        'Content-Type': 'application/json',
  };
  static Future<LoginResponse> login(Login data) async {
    Map<String, dynamic> rawBody = data.toJson();
    var encodedBody = jsonEncode(rawBody);
    final response = await http.post("$baseUrl/login", headers: defaultHeaders, body: encodedBody);
    if(response.statusCode == 200){
      return LoginResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Json');
    }
  }
  static Future<RegisterResponse> register(Register data) async {
    Map<String, dynamic> rawBody = data.toJson();
    var encodedBody = jsonEncode(rawBody);
    final response = await http.post("$baseUrl/register", headers: defaultHeaders, body: encodedBody);
    if(response.statusCode == 200){
      return RegisterResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Json');
    }
  }
  static Future<bool> logout(String token) async {
    defaultHeaders['authorization'] = "bearer $token";
    final response = await http.post("$baseUrl/logout", headers: defaultHeaders);
    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception('Failed to load Json');
    }
  }
  static Future<ProfileResponse> fetchProfile(String token) async {
    defaultHeaders['authorization'] = "bearer $token";
    final response = await http.get("$baseUrl/logout", headers: defaultHeaders);
    if(response.statusCode == 200){
      return ProfileResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Json');
    }
  }
  static Future<IsAuthResponse> isAuth(String token) async {
    defaultHeaders['authorization'] = "bearer $token";
    final response = await http.get("$baseUrl/isauth", headers: defaultHeaders);
    if(response.statusCode == 200){
      return IsAuthResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Json');
    }
  }
}