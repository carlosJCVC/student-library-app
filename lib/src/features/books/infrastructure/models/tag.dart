class Tag {
  final int tagId;
  final String name;
  final String nicename;

  Tag({
    required this.tagId,
    required this.name,
    required this.nicename,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tagId: json["tag_id"],
        name: json["name"],
        nicename: json["nicename"],
      );
}
