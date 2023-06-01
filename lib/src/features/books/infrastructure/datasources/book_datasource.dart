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

  static const rangeCount = 10;

  @override
  Future<List<Book>> getBooks(int range) async {
    const String criteria = 'most_viewed';
    final String endpoint =
        '/v1/get/?criteria=$criteria&results_range=$range,${range + rangeCount}';

    final response = await dio.get(endpoint);

    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Book>> getBooksByCategory(int range, String? category) async {
    const String criteria = 'most_viewed';

    if (category == null) {
      return getBooks(range);
    }

    final response = await dio.get(
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

  @override
  Future<Book> getBookById(int id) async {
    final response = await dio.get('/get/?id=$id&decode=true&json=true');

    if (response.statusCode != 200) {
      throw Exception('Book with ID: $id not found');
    }

    final List<Book> books = _jsonToBooks(response.data);

    return books[0];
  }

  @override
  Future<List<Book>> getBooksByTags(List<Tag> tags) async {
    final String filters = tags.map((tag) => tag.name).toList().join(',');

    final response = await dio.get('/get/?any_tags=[$filters]&order=newest');

    return _jsonToBooks(response.data);
  }

  List<Book> _jsonToBooks(dynamic json) {
    final data = jsonDecode(json);

    final List<Book> books = BookMapper.castToList(data);

    // for (var item in data) {
    //   final Book book = BookMapper.bookJsonToEntity(item);

    //   books.add(book);
    // }

    return books;
  }
}
