class TagModel {
  final int tagId;
  final String name;
  final String nicename;

  TagModel({
    required this.tagId,
    required this.name,
    required this.nicename,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        tagId: json["tag_id"],
        name: json["name"],
        nicename: json["nicename"],
      );
}
