import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/feature/authentication/screens/registrations_screen.dart';
import 'package:happy_pleace/feature/authentication/widgets/login_provider.dart';
import 'package:happy_pleace/shared/repository/shared_preferences_repository.dart';
import 'package:provider/provider.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: ChangeNotifierProvider(
        create: (context) => LoginProvider(SharedPreferencesRepository()),
        child: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    controller: loginProvider.usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ('Benutzername')),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller:
                        TextEditingController(), // No longer needed with Provider
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Passwort'),
                  ),
                  ElevatedButton(
                    onPressed: () => loginProvider.login(context),
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
      ),
    );
  }
}
