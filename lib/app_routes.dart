import 'package:app/presentation/screens/bloc_state_screen.dart';
import 'package:app/presentation/screens/custom_painter_screen.dart';
import 'package:app/presentation/screens/home_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes {
  const AppRoutes._();

  static final List<GetPage> routes = [
    GetPage(name: RouteNames.HOME.name, page: () => HomeScreen()),
    GetPage(
      name: RouteNames.CUSTOM_PAINTER_SCREEN.name,
      page: () => CustomPainterScreen(),
    ),
    GetPage(
      name: RouteNames.BLOC_STATE_SCREEN.name,
      page: () => BlocStateScreen(),
    ),
  ];
}

enum RouteNames {
  HOME("/"),
  CUSTOM_PAINTER_SCREEN("/custom-painter-screen"),
  BLOC_STATE_SCREEN("/bloc-state-screen");

  final String name;

  const RouteNames(this.name);
}
