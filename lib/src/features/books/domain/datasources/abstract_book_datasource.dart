import 'package:student_library_app/src/features/auth/domain/entities/user.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

abstract class AbstractBookDataSource {
  Future<List<Book>> getBooksByCategory(
      {String category = 'libros_programacion'});
}
