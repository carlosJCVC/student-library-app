import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

typedef CategoryCallback = Future<List<Category>> Function();

class CategoryNotifier extends StateNotifier<List<Category>> {
  bool isLoading = false;
  CategoryCallback fetchCategories;

  CategoryNotifier({required this.fetchCategories}) : super([]);

  Future<void> loadCategories() async {
    if (isLoading) return; //avoid multiple requests

    isLoading = true;
    final List<Category> categories = await fetchCategories();

    state = [...state, ...categories];

    isLoading = false;
  }

  void selectedCategory(int categoryId) {
    final newValue = state.map((c) {
      c.selected = false;
      if (c.id == categoryId) {
        c.selected = true;
      }

      return c;
    }).toList();

    state = [...newValue];
  }
}
