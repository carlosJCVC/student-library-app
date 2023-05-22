import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/infrastructure/datasources/book_datasource.dart';
import 'package:student_library_app/src/features/books/infrastructure/repositories/book_repository.dart';

final bookRepositoryProvider = Provider((ref) {
  final datasource = BookDatasource();

  return BookRepository(datasource);
});
