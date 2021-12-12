import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/app/core/enums/item_type.dart';
import 'package:tic_tac_toe/app/features/game/game_controller.dart';

// ignore: must_be_immutable
class ItemGame extends StatelessWidget {
  final controller = Get.find<GameController>();
  int pos;
  ItemType? type;
  Function()? onTap;
  ItemGame({required this.pos, this.type, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: controller.victoriousField.contains(int.parse("$pos"))
            ? Colors.blue[300]
            : Colors.grey[300],
        width: Get.width * 0.2,
        height: Get.width * 0.2,
        margin: const EdgeInsets.all(5),
        child: type != null
            ? Icon(
                type == ItemType.o
                    ? Icons.radio_button_unchecked
                    : Icons.close, // close or radio_button_unchecked
                size: 60,
              )
            : Container(),
      ),
    );
  }
}
