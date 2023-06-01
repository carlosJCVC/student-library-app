import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';
import 'package:student_library_app/src/features/books/presentation/widgets/widgets.dart';

class BookScreen extends ConsumerStatefulWidget {
  final int bookId;

  const BookScreen({super.key, required this.bookId});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(bookInfoProvider.notifier).loadBook(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookInfoProvider);
    final Book? book = books[widget.bookId];

    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    if (book == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(book: book),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _BookDetails(
                book: book,
                size: size,
                textTheme: textTheme,
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails({
    required this.book,
    required this.size,
    required this.textTheme,
  });

  final Book book;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageAndDetails(
          book: book,
          size: size,
          textTheme: textTheme,
        ),
        _BookTags(tags: book.tags),
        _BookDescription(text: "${book.contentShort}..."),
        // _BookDescription(text: book.content)

        SimilarBooks(tags: book.tags),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _BookDescription extends StatelessWidget {
  final String text;

  const _BookDescription({required this.text});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: textTheme.bodyMedium,
      ),
    );
  }
}

class _BookTags extends StatelessWidget {
  final List<Tag> tags;
  const _BookTags({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ...tags.map(
              (tag) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  label: Text(tag.name),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageAndDetails extends StatelessWidget {
  final Book book;
  final Size size;
  final TextTheme textTheme;

  const _ImageAndDetails({
    required this.book,
    required this.size,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              book.thumbnail,
              width: size.width * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: (size.width - 40) * 0.57,
            child: Column(
              children: [
                Text(book.title, style: textTheme.titleLarge),
                //Text(book.contentShort),
                const SizedBox(height: 10),
                // MovieRating(
                //   voteAverage: movie.voteAverage,
                //   popularity: movie.popularity,
                // ),
                _SubtitleText(title: 'Editor', text: book.publisher),
                _SubtitleText(title: 'Páginas', text: "${book.pages} páginas"),
                _SubtitleText(title: 'Idioma', text: book.language),
                _SubtitleText(title: 'Desde', text: book.publisherDate),
                _SubtitleText(title: 'Autor', text: book.author),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  final String title;
  final String text;

  const _SubtitleText({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title :", style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final Book book;

  const _CustomSliverAppBar({
    required this.book,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      // title: Text(movie.title),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(bottom: 0),
        // title: Text(
        //   movie.title,
        //   style: const TextStyle(fontSize: 20),
        //   textAlign: TextAlign.start,
        // ),
        title: _CustomGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.7, 1.0],
          colors: [Colors.transparent, scaffoldBackgroundColor],
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                book.cover,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const SizedBox();
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
            const _CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [Colors.black87, Colors.transparent],
            ),
            const _CustomGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.3],
              colors: [Colors.black87, Colors.transparent],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({
    required this.begin,
    required this.end,
    required this.stops,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
