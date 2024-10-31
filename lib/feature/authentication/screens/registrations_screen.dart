import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text('Registrierung'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Benutzername',
                  hintText:
                      'Mindestens 8 Zeichen, Buchstaben, Zahlen und Unterstriche',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Benutzername muss mindestens 8 Zeichen lang sein.';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                    return 'Nur Buchstaben, Zahlen und Unterstriche erlaubt.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Passwort',
                  hintText:
                      'Mindestens 8 Zeichen, Groß- und Kleinbuchstaben sowie eine Zahl',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Passwort muss mindestens 8 Zeichen lang sein.';
                  }
                  if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).+$')
                      .hasMatch(value)) {
                    return 'Passwort muss mindestens einen Groß- und Kleinbuchstaben sowie eine Zahl enthalten.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-Mail',
                  hintText: 'Gültige E-Mail-Adresse',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value!)) {
                    return 'Bitte gib eine gültige E-Mail-Adresse ein.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    final email = _emailController.text;

                    if (kDebugMode) {
                      print(
                          'Username: $username, Password: $password, Email: $email');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: shadowBlue,
                  shadowColor: hpwhite,
                ),
                child: const Text(
                  'Registrieren',
                  style: TextStyle(
                      color: hpwhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
