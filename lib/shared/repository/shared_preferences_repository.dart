import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static const String _usernameKey = 'username';
  static const String _passwordKey = 'password';
  static const String _emailKey = 'email';

  Future<void> saveUserCredentials(
      String username, String password, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_passwordKey, password);
    await prefs.setString(_emailKey, email);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_passwordKey);
    await prefs.remove(_emailKey);
  }

  saveLogin(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_passwordKey, password);
  }

  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (storedUsername != null && storedPassword != null) {
      if (storedUsername == userName && storedPassword == password) {
        await prefs.setString('username', userName);
        await prefs.setString('password', password);

        return true;
      }
    }

    return false;
  }
}
