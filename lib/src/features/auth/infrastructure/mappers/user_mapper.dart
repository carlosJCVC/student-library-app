import 'package:student_library_app/src/features/auth/domain/entities/entities.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        cellPhone: json['cellPhone'] ?? '',
        avatar: json['avatar'] ?? '',
        token: json['token'],
      );
}