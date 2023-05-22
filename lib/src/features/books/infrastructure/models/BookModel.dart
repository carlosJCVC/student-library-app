import 'dart:convert';

import 'package:student_library_app/src/features/books/infrastructure/models/category.dart';
import 'package:student_library_app/src/features/books/infrastructure/models/tag.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String content;
  final String contentShort;
  final String publisher;
  final String publisherDate;
  final String pages;
  final String language;
  final String urlDetails;
  final String urlDownload;
  final String cover;
  final String thumbnail;
  final String numComments;
  final List<Category> categories;
  final List<Tag> tags;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.contentShort,
    required this.publisher,
    required this.publisherDate,
    required this.pages,
    required this.language,
    required this.urlDetails,
    required this.urlDownload,
    required this.cover,
    required this.thumbnail,
    required this.numComments,
    required this.categories,
    required this.tags,
  });

  factory BookModel.fromRawJson(String str) =>
      BookModel.fromJson(json.decode(str));

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["ID"],
        title: json["title"],
        author: json["author"],
        content: json["content"],
        contentShort: json["content_short"],
        publisher: json["publisher"],
        publisherDate: json["publisher_date"],
        pages: json["pages"],
        language: json["language"],
        urlDetails: json["url_details"],
        urlDownload: json["url_download"],
        cover: json["cover"],
        thumbnail: json["thumbnail"],
        numComments: json["num_comments"],
        categories: List<Category>.from(
          json["categories"].map((x) => Category.fromJson(x)),
        ),
        tags: List<Tag>.from(
          json["tags"].map((x) => Tag.fromJson(x)),
        ),
      );
}
