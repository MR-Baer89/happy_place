import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/feature/authentication/screens/registrations_screen.dart';
import 'package:happy_pleace/feature/home/screens/home_screen.dart';
import 'package:happy_pleace/shared/repository/shared_preferences_repository.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Screen',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SharedPreferencesRepository _sharedPreferencesRepository =
      SharedPreferencesRepository();

  @override
  void initState() {
    super.initState();
    _getUsernameFromSharedPrefs();
  }

  Future<void> _getUsernameFromSharedPrefs() async {
    final username = await _sharedPreferencesRepository.getUsername();
    if (username != null) {
      _usernameController.text = username;
    }
  }

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Check credentials using the repository
    final isLoginSuccessful = await _sharedPreferencesRepository.login(
        userName: username, password: password);

    if (isLoginSuccessful) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falscher Benutzername oder Passwort')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dein Logo hier
                SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/images/happy_place.png')),
                const SizedBox(height: 20),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('Benutzername')),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Passwort'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: shadowBlue, shadowColor: hpwhite),
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: hpwhite),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: shadowBlue, shadowColor: hpwhite),
                  child: const Text(
                    'Account erstellen',
                    style: TextStyle(color: hpwhite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
