import 'package:student_library_app/src/features/auth/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

class BookMapper {
  static Book bookJsonToEntity(Map<String, dynamic> json) => Book(
        id: json['ID'],
        title: json['title'],
        author: json['author'],
        content: json['content'],
        contentShort: json['content_short'],
        thumbnail: json['thumbnail'],
        cover: json['cover'],
        language: json['language'],
      );
}
