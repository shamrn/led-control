class Mode {
  int id;
  String name;
  String imageUrl;

  Mode({required this.id, required this.name, required this.imageUrl});

  factory Mode.fromJson(Map<String, dynamic> json) {
    return Mode(id: json['code'], name: json['name'], imageUrl: json['image']);
  }
}
