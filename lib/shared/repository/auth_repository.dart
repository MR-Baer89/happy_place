import 'package:happy_place/shared/model/user_data.dart';

abstract class AuthRepository {
  Future<List<UserData>> getAllUsers();

  Future<bool> addUser(String userName, String password);

  Future<void> editUser(UserData user);

  Future<bool> login({
    required String userName,
    required String password,
  });

  Future<void> logout();

  Future<UserData?> getCurrentUser();
}
