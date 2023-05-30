import 'package:student_library_app/src/features/books/domain/datasources/book_datasource.dart';
import 'package:student_library_app/src/features/books/domain/entities/book.dart';
import 'package:student_library_app/src/features/books/domain/entities/category.dart';
import 'package:student_library_app/src/features/books/domain/repositories/book_repository.dart';

class BookRepository extends IBookRepository {
  final IBookDataSource datasource;

  BookRepository(this.datasource);

  @override
  Future<List<Book>> getBooks() {
    return datasource.getBooks();
  }

  @override
  Future<List<Book>> getBooksByCategory(String? category) {
    return datasource.getBooksByCategory(category);
  }

  @override
  Future<List<Category>> getCategories() {
    return datasource.getCategories();
  }
}
