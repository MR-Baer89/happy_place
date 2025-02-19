import 'package:happy_place/shared/model/user_data.dart';
import 'package:happy_place/shared/repository/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  UserData? _currentUser;
  final List<UserData> _users = [
    UserData(userName: "kai@aa.de", password: "passwort"),
  ];

  @override
  Future<List<UserData>> getAllUsers() {
    return Future.value(_users);
  }

  @override
  Future<bool> addUser(String newUserName, String newPassword) {
    // Überprüfen, ob es den User schon gibt.
    for (UserData user in _users) {
      if (newUserName == user.userName) {
        return Future.value(false);
      }
    }
    UserData newUser = UserData(userName: newUserName, password: newPassword);
    _users.add(newUser);

    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) {
    for (UserData currentUser in _users) {
      if (currentUser.userName == userName) {
        if (currentUser.password == password) {
          _currentUser = currentUser;

          return Future.value(true);
        } else {
          return Future.value(false);
        }
      }
    }

    return Future.value(false);
  }

  @override
  Future<void> logout() {
    _currentUser = null;

    return Future.value();
  }

  @override
  Future<UserData?> getCurrentUser() {
    return Future.delayed(
      const Duration(milliseconds: 1234),
      () => _currentUser,
    );
  }

  @override
  Future<void> editUser(UserData user) {
    throw UnimplementedError();
  }
}
