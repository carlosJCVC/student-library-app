class CategoryModel {
  final int categoryId;
  final String name;
  final String nicename;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.nicename,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["category_id"],
        name: json["name"],
        nicename: json["nicename"],
      );
}
