import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/book_notifier.dart';

import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';

final bookByCategoryProvider =
    StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);

  return BookNotifier(fetchBooks: bookRepository.getBooksByCategory);
});
