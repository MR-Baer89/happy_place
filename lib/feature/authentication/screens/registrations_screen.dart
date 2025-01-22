import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/feature/home/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrierung erfolgreich!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Das Passwort ist zu schwach')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Die E-Mail-Adresse ist bereits vergeben')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ein Fehler ist aufgetreten: ${e.message}')),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
          backgroundColor: shadowBlue, title: const Text('Registrierung')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-Mail'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bitte gib eine E-Mail-Adresse ein';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Passwort'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bitte gib ein Passwort ein';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                    backgroundColor: shadowBlue, shadowColor: hpwhite),
                child: const Text(
                  'Registrieren',
                  style: TextStyle(color: hpwhite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
