import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

abstract class AbstractBookRepository {
  Future<List<Book>> getBooksByCategory(
      {String category = 'libros_programacion'});
}
