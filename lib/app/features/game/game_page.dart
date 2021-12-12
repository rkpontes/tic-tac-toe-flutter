import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/app/core/enums/item_type.dart';
import 'package:tic_tac_toe/app/features/game/game_controller.dart';
import 'package:tic_tac_toe/app/features/game/widgets/item.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      init: GameController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SizedBox(
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      controller.printDuration(
                        Duration(seconds: controller.duration),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      controller.titlePage.value,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.6,
                    height: Get.width * 0.6,
                    margin: const EdgeInsets.all(10),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount: controller.gameState.pos!.length,
                        itemBuilder: (context, index) {
                          return ItemGame(
                            pos: index,
                            type: controller.gameState.pos![index] == 'o'
                                ? ItemType.o
                                : controller.gameState.pos![index] == 'x'
                                    ? ItemType.x
                                    : null,
                            onTap: () => controller.gameState.starting!
                                ? controller.onItemSelected(index)
                                : null,
                          );
                        }),
                  ),
                  const SizedBox(height: 10),
                  !controller.gameState.starting!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            child: Text(controller.victoriousField.isNotEmpty
                                ? 'Recomeçar'
                                : 'Começar'),
                            onPressed: () => controller.onStartGame(),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 20,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            child: const Text('Desistir'),
                            onPressed: () => controller.leave(),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 20,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      child: const Text('Resultados'),
                      onPressed: !controller.gameState.starting!
                          ? () => controller.onResultButtonClick()
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
