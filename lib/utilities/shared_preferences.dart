import 'package:shared_preferences/shared_preferences.dart';

class BikesafeSharedPreferences {
  final SharedPreferences _sharedPreferences;

  static final String _authToken = "AUTH_TOKEN";

  BikesafeSharedPreferences(this._sharedPreferences);

  static Future<BikesafeSharedPreferences> getInstance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return BikesafeSharedPreferences(sharedPreferences);
  }

  clear() async {
    await _sharedPreferences.remove(_authToken);
  }

  setAuthToken(String value) async {
    await _sharedPreferences.setString(_authToken, value);
  }

  String getAuthToken(){
    return _sharedPreferences.getString(_authToken);
  }
}