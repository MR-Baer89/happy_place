import 'package:flutter/material.dart';
import 'package:happy_place/feature/home/screens/home_screen.dart';
import 'package:happy_place/shared/repository/shared_preferences_repository.dart';

class LoginProvider extends ChangeNotifier {
  final SharedPreferencesRepository _sharedPreferencesRepository;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginProvider(this._sharedPreferencesRepository)
      : usernameController = TextEditingController(),
        passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    final isLoginSuccessful = await _sharedPreferencesRepository.login(
        userName: username, password: password);

    if (isLoginSuccessful) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falscher Benutzername oder Passwort')),
        );
      }
    }
  }
}
