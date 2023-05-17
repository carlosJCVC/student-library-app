import 'package:dio/dio.dart';
import 'package:student_library_app/src/config/constants/environment.dart';

import 'package:student_library_app/src/features/auth/domain/datasources/abstract_auth_datasource.dart';
import 'package:student_library_app/src/features/auth/domain/entities/entities.dart';
import 'package:student_library_app/src/features/auth/infrastructure/infrastructure.dart';

class AuthDatasource extends AbstractAuthDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<User> signIn(String email, String password) async {
    try {
      final response = await dio.post('/v1/auth/login', data: {
        'email': email,
        'password': password,
      });

      final User user = UserMapper.userJsonToEntity(response.data);

      return user;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> signUp(String firstName, String lastName, String email,
      String gender, String cellPhone, String avatar, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final user = UserMapper.userJsonToEntity(response.data);

      return user;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Invalid Token');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
