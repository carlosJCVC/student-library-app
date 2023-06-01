import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

typedef BookCallback = Future<List<Book>> Function(
    int rangue, String? category);

class BookNotifier extends StateNotifier<List<Book>> {
  bool isLoading = false;
  int range = 0;
  int rangeByCategory = 0;
  String categorySelected = '';
  BookCallback fetchBooks;

  BookNotifier({required this.fetchBooks}) : super([]);

  Future<void> loadBooks() async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;

    if (categorySelected.isNotEmpty) {
      // categorySelected = "";
      // range = 0;
      // state = [];
    }

    final List<Book> books = await fetchBooks(range, null);
    state = [...state, ...books];
    isLoading = false;
    range = range + 10;
  }

  Future<void> loadByCategory(String category) async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;

    if (categorySelected != category) {
      state = [];
      rangeByCategory = 0;
      categorySelected = category;
    }

    final List<Book> books = await fetchBooks(rangeByCategory, category);
    state = rangeByCategory == 0 ? [...books] : [...state, ...books];
    rangeByCategory = rangeByCategory + 10;

    isLoading = false;
  }
}
