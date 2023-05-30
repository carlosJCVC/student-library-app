class Category {
  final int id;
  final String name;
  final String nicename;
  bool isSelected;

  Category({
    required this.id,
    required this.name,
    required this.nicename,
    this.isSelected = false,
  });

  set selected(bool value) {
    isSelected = value;
  }

  bool get selected {
    return isSelected;
  }
}
