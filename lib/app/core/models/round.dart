import 'package:tic_tac_toe/app/core/models/player.dart';

class Round {
  int? id;
  DateTime? duration;
  Player? playerOne;
  Player? playerTwo;
  Player? winner;

  Round(
      {required this.id,
      required this.duration,
      required this.playerOne,
      required this.playerTwo});

  Round.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    return data;
  }
}
