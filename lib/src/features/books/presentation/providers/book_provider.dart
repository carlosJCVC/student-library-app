import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

import 'package:student_library_app/src/features/books/presentation/providers/book_repository_provider.dart';

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);

  return BookNotifier(fetchBooks: bookRepository.getBooksByCategory);
});

typedef BookCallback = Future<List<Book>> Function({String category});

class BookNotifier extends StateNotifier<List<Book>> {
  bool isLoading = false;
  BookCallback fetchBooks;

  BookNotifier({required this.fetchBooks}) : super([]);

  Future<void> loadBooks() async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;
    final List<Book> books = await fetchBooks(category: 'libros_programacion');

    state = [...state, ...books];

    isLoading = false;
  }
}
