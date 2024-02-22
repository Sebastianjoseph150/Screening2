import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<void> addUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  Future<bool> checkUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    return storedUsername == username;
  }
}
