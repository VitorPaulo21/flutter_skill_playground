import 'package:app/domain/models/card_item.dart';
import 'package:app/locator.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final List<CardItem> items = [
    CardItem(
      title: 'CustomPainter Screen',
      route: RouteNames.CUSTOM_PAINTER_SCREEN,
      image: "assets/custom-paint.jpg",
    ),
    CardItem(
      title: 'Router 2.0 Screen',
      route: RouteNames.ROUTER_2,
      image: "assets/navigator_2.jpg",
    ),
    CardItem(
      title: 'Bloc Screen',
      route: RouteNames.BLOC_STATE_SCREEN,
      image: "assets/bloc.png",
    ),
    CardItem(
      title: 'Platform Channels Screen',
      route: RouteNames.PLATFORM_CHANNEL_SCREEN,
      image: "assets/platform_channel.png",
    ),
    CardItem(
      title: 'Performance Screen',
      route: RouteNames.PERFORMANCE_SCREEN,
      image: "assets/performance.jpg",
    ),
    CardItem(
      title: 'Isolate Screen',
      route: RouteNames.ISOLATE_SCREEN,
      image: "assets/isolate.png",
    ),
    CardItem(
      title: 'AnimationController Screen',
      route: RouteNames.ANIMATION_SCREEN,
      image: "assets/animation.gif",
    ),
    CardItem(
      title: 'StreamBuilder Screen',
      route: RouteNames.STREAM_BUILDER_ERROR_SCREEN,
      image: "assets/stream_builder.jpg",
    ),
    CardItem(
      title: 'Slivers Screen',
      route: RouteNames.SLIVER_SCREEN,
      image: "assets/sliver.jpg",
    ),
    CardItem(
      title: 'Dependency Injection',
      route: RouteNames.DEPENDENCY_INJECTION_SCREEN,
      image: "assets/dependency_injection.png",
    ),
  ];

  static final SkillRouterDelegate _router = sl.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Skills Showcase')),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.landscape
              ? 1.778
              : 1.3,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            elevation: 5,
            child: InkWell(
              onTap: () {
                _router.push(item.route);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Hero(
                        tag: item.route.name,
                        child: Image.asset(item.image, fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 23,
                      child: FittedBox(
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
