import 'package:app/presentation/screens/bloc_state_screen.dart';
import 'package:app/presentation/screens/custom_painter_screen.dart';
import 'package:app/presentation/screens/home_screen.dart';
import 'package:app/presentation/screens/isolate_screen.dart';
import 'package:app/presentation/screens/performance_screen.dart';
import 'package:app/presentation/screens/platform_channel_screen.dart';
import 'package:app/presentation/screens/stream_builder_error_handler_screen.dart';
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
    GetPage(
      name: RouteNames.PLATFORM_CHANNEL_SCREEN.name,
      page: () => PlatformChannelsScreen(),
    ),
    GetPage(
      name: RouteNames.PERFORMANCE_SCREEN.name,
      page: () => PerformanceScreen(),
    ),
    GetPage(
      name: RouteNames.ISOLATE_SCREEN.name,
      page: () => PiCalculationScreen(),
    ),
    GetPage(
      name: RouteNames.STREAM_BUILDER_ERROR_SCREEN.name,
      page: () => StreamBuilderErrorHandlerScreen(),
    ),
  ];
}

enum RouteNames {
  HOME("/"),
  CUSTOM_PAINTER_SCREEN("/custom-painter-screen"),
  BLOC_STATE_SCREEN("/bloc-state-screen"),
  PLATFORM_CHANNEL_SCREEN("/platform-channel-screen"),
  PERFORMANCE_SCREEN("/performance-screen"),
  ISOLATE_SCREEN("/isolate-screen"),
  STREAM_BUILDER_ERROR_SCREEN("/stream-builder-error-screen");

  final String name;

  const RouteNames(this.name);
}
