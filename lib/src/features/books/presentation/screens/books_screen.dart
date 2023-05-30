import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/presentation/providers/book_provider.dart';

import 'package:student_library_app/src/features/books/presentation/widgets/widgets.dart';

class BooksScreen extends ConsumerStatefulWidget {
  const BooksScreen({super.key});

  @override
  BooksScreenState createState() => BooksScreenState();
}

class BooksScreenState extends ConsumerState<BooksScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(bookProvider.notifier).loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Column(
        children: [
          HorizontalBooks(
            books: books,
            title: 'Programming Books',
            subTitle: 'Most Viewed',
            loadNextPage: () {},
          ),
        ],
      ),
    );
  }
}
