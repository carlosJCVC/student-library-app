import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:student_library_app/src/config/constants/environment.dart';
import 'package:student_library_app/src/features/books/domain/datasources/datasources.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/infrastructure/mappers/mappers.dart';

class BookDatasource extends AbstractBookDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.bookApiUrl,
    ),
  );

  @override
  Future<List<Book>> getBooksByCategory(
      {String category = 'libros_programacion'}) async {
    const String criteria = 'most_viewed';

    final response = await dio.post(
      '/v1/get/?category=$category&criteria=$criteria',
    );

    final data = jsonDecode(response.data);

    final List<Book> books = [];

    for (var item in data) {
      final Book book = BookMapper.bookJsonToEntity(item);

      books.add(book);
    }

    return books;
  }
}
