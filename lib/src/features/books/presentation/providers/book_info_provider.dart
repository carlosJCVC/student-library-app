import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';

final bookInfoProvider =
    StateNotifierProvider<BookInfoNotifier, Map<int, Book>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);

  return BookInfoNotifier(getBook: bookRepository.getBookById);
});

typedef GetBookCallback = Future<Book> Function(int bookId);

class BookInfoNotifier extends StateNotifier<Map<int, Book>> {
  final GetBookCallback getBook;

  BookInfoNotifier({required this.getBook}) : super({});

  Future<void> loadBook(int bookId) async {
    if (state[bookId] != null) return;

    final book = await getBook(bookId);

    state = {...state, bookId: book};
  }
}
