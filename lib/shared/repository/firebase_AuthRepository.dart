import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_pleace/shared/model/user_data.dart';
import 'package:happy_pleace/shared/repository/auth_repository';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> addUser(String userName, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> editUser(UserData user) {
    throw UnimplementedError();
  }

  @override
  Future<List<UserData>> getAllUsers() {
    throw UnimplementedError();
  }

  @override
  Future<UserData?> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    try {
      final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      log(credential.toString());
    } catch (_) {
      return false;
    }

    return Future.value(true);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
