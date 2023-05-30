import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

class BookCardSwipper extends StatelessWidget {
  final List<Book> books;

  const BookCardSwipper({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (books.isEmpty) {
      return SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: books.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          final Book book = books[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(book.cover),
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
