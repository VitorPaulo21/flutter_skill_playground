import 'package:app/locator.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:flutter/material.dart';

class Router2Screen extends StatelessWidget {
  const Router2Screen({super.key});

  static final SkillRouterDelegate _router = sl.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Router 2.0 Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              key: ValueKey("telaA"),
              onPressed: () => _router.push(RouteNames.ROUTER_2_SCREEN_A),
              child: const Text('Navegar para Screen A'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: ValueKey("telaB"),
              onPressed: () => _router.push(RouteNames.ROUTER_2_SCREEN_B),
              child: const Text('Navegar para Screen B'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _router.pop(),
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Esta é a Screen A, navegada via Router 2.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Esta é a Screen B, navegada via Router 2.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
