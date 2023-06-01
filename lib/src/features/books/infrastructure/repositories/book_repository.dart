import 'package:student_library_app/src/features/books/domain/datasources/book_datasource.dart';
import 'package:student_library_app/src/features/books/domain/entities/book.dart';
import 'package:student_library_app/src/features/books/domain/entities/category.dart';
import 'package:student_library_app/src/features/books/domain/entities/tag.dart';
import 'package:student_library_app/src/features/books/domain/repositories/book_repository.dart';

class BookRepository extends IBookRepository {
  final IBookDataSource datasource;

  BookRepository(this.datasource);

  @override
  Future<List<Book>> getBooks(int range) {
    return datasource.getBooks(range);
  }

  @override
  Future<List<Book>> getBooksByCategory(range, String? category) {
    return datasource.getBooksByCategory(range, category);
  }

  @override
  Future<List<Category>> getCategories() {
    return datasource.getCategories();
  }

  @override
  Future<Book> getBookById(int id) {
    return datasource.getBookById(id);
  }

  @override
  Future<List<Book>> getBooksByTags(List<Tag> tags) {
    return datasource.getBooksByTags(tags);
  }
}
