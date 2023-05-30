import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/infrastructure/models/book_model.dart';

class BookMapper {
  static Book bookJsonToEntity(BookModel book) => Book(
        id: book.id,
        title: book.title,
        author: book.author,
        content: book.content,
        contentShort: book.contentShort,
        publisher: book.publisher,
        publisherDate: book.publisherDate,
        thumbnail: book.thumbnail,
        cover: book.cover,
        language: book.language,
        urlDetails: book.urlDetails,
        urlDownload: book.urlDownload,
        categories: book.categories
            .map((c) =>
                Category(id: c.categoryId, name: c.name, nicename: c.nicename))
            .toList(),
        tags: book.tags
            .map((t) => Tag(id: t.tagId, name: t.name, nicename: t.nicename))
            .toList(),
      );

  static List<Book> castToList(List data) {
    final List<Book> books = data
        .map((b) {
          final item = BookModel.fromJson(b);
          final Book book = BookMapper.bookJsonToEntity(item);

          return book;
        })
        .cast<Book>()
        .toList();

    return books;
  }
}
