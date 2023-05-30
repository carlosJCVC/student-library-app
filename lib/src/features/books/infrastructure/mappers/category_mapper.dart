import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

class CategoryMapper {
  static Category categoryJsonToEntity(Map<String, dynamic> json) => Category(
        id: json['category_id'],
        name: json['name'],
        nicename: json['nicename'],
      );
}
