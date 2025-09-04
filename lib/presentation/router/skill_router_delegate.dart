import 'package:app/domain/models/route_data.dart';
import 'package:app/presentation/screens/animation_screen.dart';
import 'package:app/presentation/screens/bloc_state_screen.dart';
import 'package:app/presentation/screens/custom_painter_screen.dart';
import 'package:app/presentation/screens/dependency_injection_screen.dart';
import 'package:app/presentation/screens/home_screen.dart';
import 'package:app/presentation/screens/isolate_screen.dart';
import 'package:app/presentation/screens/performance_screen.dart';
import 'package:app/presentation/screens/platform_channel_screen.dart';
import 'package:app/presentation/screens/router_2_screen.dart';
import 'package:app/presentation/screens/sliver_screen.dart';
import 'package:app/presentation/screens/stream_builder_error_handler_screen.dart';
import 'package:flutter/material.dart';

class SkillRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<RouteData> _history = [];
  RouteData _currentPath = RouteData('/', UniqueKey());

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  String? get currentConfiguration => _currentPath.path;

  void push(RouteNames route) {
    _history.add(_currentPath);
    _currentPath = RouteData(route.name, UniqueKey());
    notifyListeners();
  }

  void pop() {
    if (_history.isNotEmpty) {
      _currentPath = _history.removeLast();
      notifyListeners();
    } else if (_currentPath.path != '/') {
      _currentPath = RouteData('/', UniqueKey());
      notifyListeners();
    }
  }

  void replace(String path) {
    if (_history.isNotEmpty) {
      _history.removeLast();
    }
    _currentPath = RouteData(path, UniqueKey());
    notifyListeners();
  }

  Widget _getScreenForPath(String path) {
    switch (RouteNames.fromName(path)) {
      case RouteNames.HOME:
        return HomeScreen();
      case RouteNames.CUSTOM_PAINTER_SCREEN:
        return CustomPainterScreen();
      case RouteNames.ROUTER_2:
        return Router2Screen();
      case RouteNames.ROUTER_2_SCREEN_A:
        return ScreenA();
      case RouteNames.ROUTER_2_SCREEN_B:
        return ScreenB();
      case RouteNames.BLOC_STATE_SCREEN:
        return BlocStateScreen();
      case RouteNames.PLATFORM_CHANNEL_SCREEN:
        return PlatformChannelsScreen();
      case RouteNames.PERFORMANCE_SCREEN:
        return PerformanceScreen();
      case RouteNames.ISOLATE_SCREEN:
        return IsolateScreen();
      case RouteNames.STREAM_BUILDER_ERROR_SCREEN:
        return StreamBuilderErrorHandlerScreen();
      case RouteNames.ANIMATION_SCREEN:
        return AnimationScreen();
      case RouteNames.SLIVER_SCREEN:
        return SliverScreen();
      case RouteNames.DEPENDENCY_INJECTION_SCREEN:
        return DependencyInjectionScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final allRoutes = [..._history, _currentPath];

    return Navigator(
      key: navigatorKey,
      pages: [
        for (final routes in allRoutes)
          MaterialPage(key: routes.key, child: _getScreenForPath(routes.path)),
      ],
      onDidRemovePage: (page) {
        final removedKey = page.key;

        if (removedKey == _currentPath.key) {
          pop();
        }

        _history.removeWhere((entry) => entry.key == removedKey);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    _currentPath = RouteData(configuration, UniqueKey());
    _history.clear();
    notifyListeners();
  }

  @override
  Future<bool> popRoute() async {
    if (_history.isNotEmpty || _currentPath.path != '/') {
      pop();
      return true;
    }
    return false;
  }
}

enum RouteNames {
  HOME("/"),
  CUSTOM_PAINTER_SCREEN("/custom-painter-screen"),
  ROUTER_2("/router-2.0"),
  ROUTER_2_SCREEN_A("/router-2.0/screen-a"),
  ROUTER_2_SCREEN_B("/router-2.0/screen-b"),
  BLOC_STATE_SCREEN("/bloc-state-screen"),
  PLATFORM_CHANNEL_SCREEN("/platform-channel-screen"),
  PERFORMANCE_SCREEN("/performance-screen"),
  ISOLATE_SCREEN("/isolate-screen"),
  STREAM_BUILDER_ERROR_SCREEN("/stream-builder-error-screen"),
  ANIMATION_SCREEN("/animation-screen"),
  SLIVER_SCREEN("/sliver-screen"),
  DEPENDENCY_INJECTION_SCREEN("/dependency-injection-screen");

  final String name;

  const RouteNames(this.name);

  factory RouteNames.fromName(final String name) {
    return values.firstWhere((route) => route.name == name);
  }
}
