import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';
import 'package:student_library_app/src/features/books/presentation/widgets/widgets.dart';

class SimilarBooks extends ConsumerWidget {
  final List<Tag> tags;

  const SimilarBooks({super.key, required this.tags});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarBooksFuture = ref.watch(similarBooksProvider(tags));

    return similarBooksFuture.when(
        data: (books) => HorizontalBooks(
              title: "Libros Similares",
              subTitle: "Ver mas",
              books: books,
              loadNextPage: () {},
            ),
        error: (_, __) {
          return const Center(
            child: Text('No se pudo cargar libros similares'),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        });
  }
}
