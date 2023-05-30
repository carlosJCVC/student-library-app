import 'package:student_library_app/src/features/books/infrastructure/models/book_model.dart';

class BooksResponse {
  final List<BookModel> results;

  BooksResponse({
    required this.results,
  });

  factory BooksResponse.fromJson(Map<String, dynamic> json) => BooksResponse(
        results: List<BookModel>.from(
          json["results"].map((x) => BookModel.fromJson(x)),
        ),
      );
}
