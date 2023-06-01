import 'package:student_library_app/src/features/books/domain/entities/entities.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String content;
  final String contentShort;
  final String publisher;
  final String publisherDate;
  final String pages;
  final String thumbnail;
  final String cover;
  final String language;
  final String urlDetails;
  final String urlDownload;
  final List<Category> categories;
  final List<Tag> tags;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.contentShort,
    required this.publisher,
    required this.publisherDate,
    required this.pages,
    required this.urlDetails,
    required this.thumbnail,
    required this.cover,
    required this.language,
    required this.urlDownload,
    required this.categories,
    required this.tags,
  });
}
