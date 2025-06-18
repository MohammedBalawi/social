class BaseItem {
  final String id;
  final String name;

  BaseItem({required this.id, required this.name});

  factory BaseItem.fromMap(Map<String, dynamic> json) {
    final id = json.keys.first;
    return BaseItem(
      id: id,
      name: json[id],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }
}
