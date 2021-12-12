import 'dart:async';

import 'package:get/get.dart';
import 'package:tic_tac_toe/app/core/models/game.dart';
import 'package:tic_tac_toe/app/core/routes/app_routes.dart';

class GameController extends GetxController {
  Game gameState = Get.put(Game());

  String itemTurn = "o";
  RxString titlePage = "Clique em [ Começar ]!".obs;

  List<int> playsOne = <int>[];
  List<int> playsTwo = <int>[];
  List<int> victoriousField = <int>[];

  final List<List<int>> winningConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  int duration = 0;
  Timer? time;

  void startTimer() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration++;
      update();
    });
  }

  void stopTimer() {
    time!.cancel();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void onStartGame() {
    duration = 0;
    gameState.start();
    startTimer();
    playsOne.clear();
    playsTwo.clear();
    victoriousField.clear();
    itemTurn = "o";
    titlePage.value = "Jogador 1 jogando...";
    update();
  }

  void onStopGame() {
    gameState.results!.add(
      "${titlePage.value.replaceAll('!', '')} com duração de ${printDuration(Duration(seconds: duration))}",
    );
    gameState.stop();
    gameState.save();
    stopTimer();
    update();
  }

  void leave() {
    if (itemTurn == "o") {
      titlePage.value = "Jogador 2 venceu!";
    } else {
      titlePage.value = "Jogador 1 venceu!";
    }
    onStopGame();
  }

  void onItemSelected(int pos) {
    if (gameState.starting == true) {
      if (gameState.pos![pos] == "") {
        gameState.pos![pos] = itemTurn;
        verifyGameState(pos);
      }
      if (gameState.starting!) {
        changeTurn(pos);
      }
      update();
    }
  }

  changeTurn(int pos) {
    if (itemTurn == "o") {
      itemTurn = "x";
      titlePage.value = "Jogador 2 jogando...";
      playsOne.add(pos);
    } else {
      itemTurn = "o";
      titlePage.value = "Jogador 1 jogando...";
      playsTwo.add(pos);
    }
  }

  Future<void> verifyGameState(int pos) async {
    if (playsOne.length > 4) {
      titlePage.value = "Deu velha! 🤡";
      onStopGame();
    }

    if (playsTwo.length > 4) {
      titlePage.value = "Deu velha! 🤡";
      onStopGame();
    }

    //print(winningConditions);
    for (var e in winningConditions) {
      //print("${gameState.pos![e[0]] == itemTurn} && ${gameState.pos![e[1]] == itemTurn} && ${gameState.pos![e[2]] == itemTurn}");
      //print("==");
      //
      if (gameState.pos![e[0]] == itemTurn &&
          gameState.pos![e[1]] == itemTurn &&
          gameState.pos![e[2]] == itemTurn) {
        if (itemTurn == "o") {
          titlePage.value = "Jogador 1 venceu!";
        } else {
          titlePage.value = "Jogador 2 venceu!";
        }
        onStopGame();
        victoriousField.assignAll(e);
        update();
        break;
      }
    }

    update();
  }

  bool isValid(String? s) {
    if (s == 'x' || s == '0') {
      return true;
    } else {
      return false;
    }
  }

  void onResultButtonClick() {
    Get.toNamed(Routes.RESULTS);
  }
}
