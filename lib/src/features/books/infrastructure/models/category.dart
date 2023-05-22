class Category {
  final int categoryId;
  final String name;
  final String nicename;

  Category({
    required this.categoryId,
    required this.name,
    required this.nicename,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        name: json["name"],
        nicename: json["nicename"],
      );
}
