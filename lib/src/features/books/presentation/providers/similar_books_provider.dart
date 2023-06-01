import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

import 'providers.dart';

final similarBooksProvider = FutureProvider.family((ref, List<Tag> tags) {
  final bookRepository = ref.watch(bookRepositoryProvider);
  return bookRepository.getBooksByTags(tags);
});
