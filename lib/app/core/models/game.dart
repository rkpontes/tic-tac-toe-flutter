import 'package:get_storage/get_storage.dart';

class Game {
  bool? starting = false;
  List<String?>? pos = ["", "", "", "", "", "", "", "", ""];
  List<String>? results = <String>[];

  Game() {
    read();
  }

  void save() {
    GetStorage('tic-tac-toe').write('game', toJson());
  }

  void read() {
    var json = GetStorage('tic-tac-toe').read('game');
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    starting = json['starting'];
    //pos = json['pos'];
    results = json['results']!.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['starting'] = starting;
    data['pos'] = pos;
    data['results'] = results;
    return data;
  }

  String toText() =>
      '''${pos![0]}|${pos![1]}|${pos![2]}\n${pos![3]}|${pos![4]}|${pos![5]}\n${pos![6]}|${pos![7]}|${pos![8]}\n''';

  void start() {
    starting = true;
    pos = ["", "", "", "", "", "", "", "", ""];
  }

  void stop() {
    starting = false;
  }
}
