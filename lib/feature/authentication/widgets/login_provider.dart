import 'package:flutter/material.dart';
import 'package:happy_pleace/feature/home/screens/home_screen.dart';
import 'package:happy_pleace/shared/repository/shared_preferences_repository.dart';

class LoginProvider extends ChangeNotifier {
  final SharedPreferencesRepository _sharedPreferencesRepository;
  final TextEditingController usernameController;
  final TextEditingController passwordController; // Add passwordController here

  LoginProvider(this._sharedPreferencesRepository)
      : usernameController = TextEditingController(),
        passwordController =
            TextEditingController(); // Initialize passwordController

  Future<void> login(BuildContext context) async {
    String username = usernameController.text;
    String password =
        passwordController.text; // Access passwordController correctly

    final isLoginSuccessful = await _sharedPreferencesRepository.login(
        userName: username, password: password);

    if (isLoginSuccessful) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falscher Benutzername oder Passwort')),
      );
    }
  }
}
