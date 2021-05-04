import 'package:bikesafe_mobile/models/is_auth_response.dart';
import 'package:bikesafe_mobile/models/login.dart';
import 'package:bikesafe_mobile/models/login_response.dart';
import 'package:bikesafe_mobile/models/profile_response.dart';
import 'package:bikesafe_mobile/repositories/account.dart';
import 'package:bikesafe_mobile/utilities/inherited_account_data_provider.dart';
import 'package:bikesafe_mobile/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';

class AccountController {
  ProfileResponse currentUser = ProfileResponse();

  static final AccountController _sharedInstance =
      AccountController._internal();

  AccountController._internal() {}
  static AccountController of(BuildContext context) {
    final InheritedAccountDataProvider binding = context
        .dependOnInheritedWidgetOfExactType<InheritedAccountDataProvider>();
    return binding.controller;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final AccountController otherUserController = other;
    return otherUserController.currentUser.uid == currentUser.uid;
  }

  factory AccountController() {
    return _sharedInstance;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  Future<bool> doLogin(String email, String password) async {
    try {
      if (email == "hola@gmail.com" || email == "a@test.com") {
        return false;
      }
      LoginResponse loginResponse =
          await AccountRepository.login(Login(email, password));
      BikesafeSharedPreferences bikesafeSharedPreferences =
          await BikesafeSharedPreferences.getInstance();
      await bikesafeSharedPreferences.setAuthToken(loginResponse.accesToken);
      ProfileResponse profileResponse =
          await AccountRepository.fetchProfile(loginResponse.accesToken);
      currentUser = profileResponse;
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> doAutoLogin() async {
    BikesafeSharedPreferences bikesafeSharedPreferences =
        await BikesafeSharedPreferences.getInstance();
    try {
      if (bikesafeSharedPreferences.getAuthToken() == null) {
        return false;
      }
      String token = bikesafeSharedPreferences.getAuthToken();
      IsAuthResponse isAuthResponse = await AccountRepository.isAuth(token);
      if (!isAuthResponse.ok) {
        return false;
      }
      ProfileResponse profileResponse =
          await AccountRepository.fetchProfile(token);
      currentUser = profileResponse;
      return true;
    } catch (error) {
      print(error.toString());
      await bikesafeSharedPreferences.clear();
      return false;
    }
  }

  Future<bool> doSignOut() async {
    try {
      BikesafeSharedPreferences bikesafeSharedPreferences =
          await BikesafeSharedPreferences.getInstance();
      await AccountRepository.logout(bikesafeSharedPreferences.getAuthToken());
      await bikesafeSharedPreferences.clear();
      currentUser = null;
      return true;
    } catch (error) {
      return false;
    }
  }
}
