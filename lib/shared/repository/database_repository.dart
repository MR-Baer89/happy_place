abstract class DatabaseRepository {
  Future<void> saveUserCredentials(
      String username, String password, String email);

  Future<String?> getUsername();

  Future<String?> getPassword();

  Future<String?> getEmail();

  Future<void> clearCredentials();

  Future<bool> login({
    required String userName,
    required String password,
  });
}
