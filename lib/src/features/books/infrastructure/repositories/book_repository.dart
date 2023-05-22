import 'package:student_library_app/src/features/books/domain/datasources/abstract_book_datasource.dart';
import 'package:student_library_app/src/features/books/domain/entities/book.dart';
import 'package:student_library_app/src/features/books/domain/repositories/abstract_book_repository.dart';

class BookRepository extends AbstractBookRepository {
  final AbstractBookDataSource datasource;

  BookRepository(this.datasource);

  @override
  Future<List<Book>> getBooksByCategory(
      {String category = 'libros_programacion'}) {
    return datasource.getBooksByCategory(category: category);
  }
}
