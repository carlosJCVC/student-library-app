import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:student_library_app/src/config/constants/environment.dart';
import 'package:student_library_app/src/features/books/domain/datasources/datasources.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/infrastructure/mappers/mappers.dart';

class BookDatasource extends IBookDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.bookApiUrl,
    ),
  );

  @override
  Future<List<Book>> getBooks() async {
    const String criteria = 'most_viewed';

    final response = await dio.post(
      '/v1/get/?criteria=$criteria',
    );

    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Book>> getBooksByCategory(String? category) async {
    const String criteria = 'most_viewed';

    if (category == null) {
      return getBooks();
    }

    final response = await dio.post(
      '/v1/get/?category=$category&criteria=$criteria',
    );

    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Category>> getCategories() async {
    final response = await dio.post(
      '/v1/get/?get_categories=all',
    );

    final data = jsonDecode(response.data);

    final List<Category> categories = [];

    final Category category = Category(
      id: -1,
      name: 'Todos',
      nicename: 'todos',
      isSelected: true,
    );

    categories.add(category);

    for (var item in data) {
      final Category category = CategoryMapper.categoryJsonToEntity(item);

      categories.add(category);
    }

    return categories;
  }

  List<Book> _jsonToBooks(dynamic json) {
    final data = jsonDecode(json);

    final List<Book> books = [];

    for (var item in data) {
      final Book book = BookMapper.bookJsonToEntity(item);

      books.add(book);
    }

    return books;
  }
}
