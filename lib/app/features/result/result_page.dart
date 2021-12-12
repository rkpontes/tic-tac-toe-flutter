import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_controller.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Resultados'),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              separatorBuilder: (_, index) => const Divider(),
              itemCount: controller.gameState.results?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    controller.gameState.results![index],
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
