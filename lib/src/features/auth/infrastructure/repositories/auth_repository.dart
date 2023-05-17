import 'package:student_library_app/src/features/auth/domain/datasources/abstract_auth_datasource.dart';
import 'package:student_library_app/src/features/auth/domain/entities/user.dart';
import 'package:student_library_app/src/features/auth/domain/repositories/abstract_auth_repository.dart';
import 'package:student_library_app/src/features/auth/infrastructure/datasources/auth_datasource.dart';

class AuthRepository extends AbstractAuthRepository {
  final AbstractAuthDataSource datasource;

  AuthRepository({
    AbstractAuthDataSource? datasource,
  }) : datasource = datasource ?? AuthDatasource();

  @override
  Future<User> signIn(String email, String password) {
    return datasource.signIn(email, password);
  }

  @override
  Future<User> signUp(String firstName, String lastName, String email,
      String gender, String cellPhone, String avatar, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
}
