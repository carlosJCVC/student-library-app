import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

typedef BookCallback = Future<List<Book>> Function(String? category);

class BookNotifier extends StateNotifier<List<Book>> {
  bool isLoading = false;
  BookCallback fetchBooks;

  BookNotifier({required this.fetchBooks}) : super([]);

  Future<void> loadBooks() async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;
    final List<Book> books = await fetchBooks(null);

    state = [...books];

    isLoading = false;
  }

  Future<void> loadByCategory(String category) async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;
    final List<Book> books = await fetchBooks(category);

    state = [...books];

    isLoading = false;
  }
}
