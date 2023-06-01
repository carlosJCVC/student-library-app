import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

abstract class IBookRepository {
  Future<List<Book>> getBooks(int range);

  Future<List<Book>> getBooksByCategory(int range, String? category);

  Future<List<Category>> getCategories();

  Future<Book> getBookById(int id);

  Future<List<Book>> getBooksByTags(List<Tag> tags);
}
