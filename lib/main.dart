import 'package:app/locator.dart';
import 'package:app/presentation/router/skill_route_information_parser.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: sl.get<SkillRouterDelegate>(),
      routeInformationParser: SkillRouteInformationParser(),
      title: 'Flutter Skill Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
