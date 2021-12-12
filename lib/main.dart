import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tic_tac_toe/app/core/routes/app_pages.dart';
import 'app/core/routes/app_routes.dart';

void main() async {
  await GetStorage.init('tic-tac-toe');
  runApp(
    GetMaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
