class Player {
  int? id;
  String? name;
  int? score;

  Player({required this.id, required this.name, required this.score});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['score'] = score;
    return data;
  }
}
