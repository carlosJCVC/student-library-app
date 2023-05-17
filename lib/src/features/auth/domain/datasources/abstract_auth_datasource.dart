import 'package:student_library_app/src/features/auth/domain/entities/user.dart';

abstract class AbstractAuthDataSource {
  Future<User> signIn(String email, String password);
  Future<User> signUp(
    String firstName,
    String lastName,
    String email,
    String gender,
    String cellPhone,
    String avatar,
    String password,
  );
  Future<User> checkAuthStatus(String token);
}
