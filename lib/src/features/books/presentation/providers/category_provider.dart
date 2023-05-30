import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/book_repository_provider.dart';
import 'package:student_library_app/src/features/books/presentation/providers/category_notifier.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);

  return CategoryNotifier(fetchCategories: bookRepository.getCategories);
});
