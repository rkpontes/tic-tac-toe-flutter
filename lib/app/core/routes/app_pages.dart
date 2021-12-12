import 'package:get/get.dart';
import 'package:tic_tac_toe/app/features/game/game_page.dart';
import 'package:tic_tac_toe/app/features/result/result_page.dart';
import 'package:tic_tac_toe/app/features/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => const SplashPage()),
    GetPage(name: Routes.GAME, page: () => const GamePage()),
    GetPage(name: Routes.RESULTS, page: () => const ResultPage()),
  ];
}
