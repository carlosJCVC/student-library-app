import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

abstract class IBookRepository {
  Future<List<Book>> getBooks();

  Future<List<Book>> getBooksByCategory(String? category);

  Future<List<Category>> getCategories();
}
