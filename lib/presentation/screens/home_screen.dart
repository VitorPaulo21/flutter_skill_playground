import 'package:app/domain/models/card_item.dart';
import 'package:app/domain/components/grid_delegates/adaptative_grid_delegate.dart';
import 'package:app/locator.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<CardItem> items = [
    CardItem(
      title: 'CustomPainter Screen',
      route: RouteNames.CUSTOM_PAINTER_SCREEN,
      image: "https://i.ytimg.com/vi/kp14Y4uHpHs/maxresdefault.jpg",
    ),
    CardItem(
      title: 'Router 2.0 Screen',
      route: RouteNames.ROUTER_2,
      image: "https://i.ytimg.com/vi/_05zUd5Kdrw/sddefault.jpg",
    ),
    CardItem(
      title: 'Bloc Screen',
      route: RouteNames.BLOC_STATE_SCREEN,
      image:
          "https://codeclusive.io/blog/introduction-to-flutter-bloc/images/bloc.png",
    ),
    CardItem(
      title: 'Platform Channels Screen',
      route: RouteNames.PLATFORM_CHANNEL_SCREEN,
      image:
          "https://miro.medium.com/v2/resize:fit:1200/1*OJ2ebAo75tLVDKe0xOMeiA.png",
    ),
    CardItem(
      title: 'Performance Screen',
      route: RouteNames.PERFORMANCE_SCREEN,
      image: "https://i.ytimg.com/vi/cVAGLDuc2xE/maxresdefault.jpg",
    ),
    CardItem(
      title: 'Isolate Screen',
      route: RouteNames.ISOLATE_SCREEN,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIrU6ie-cYV4SqQvTc_YZJEwC5rYy2BUfJg&s",
    ),
    CardItem(
      title: 'AnimationController Screen',
      route: RouteNames.ANIMATION_SCREEN,
      image: "https://miro.medium.com/1*kT7J_vQcySTcA1wnzle4tQ.gif",
    ),
    CardItem(
      title: 'StreamBuilder Screen',
      route: RouteNames.STREAM_BUILDER_ERROR_SCREEN,
      image: "https://i.ytimg.com/vi/MkKEWHfy99Y/maxresdefault.jpg",
    ),
    CardItem(
      title: 'Slivers Screen',
      route: RouteNames.SLIVER_SCREEN,
      image: "https://i.ytimg.com/vi/VhcxuShoW3k/maxresdefault.jpg",
    ),
    CardItem(
      title: 'Dependency Injection',
      route: RouteNames.DEPENDENCY_INJECTION_SCREEN,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw5fh7HByQFptrygpBDV3dzCLx9TSkgVwyzg&s",
    ),
  ];

  static final SkillRouterDelegate _router = sl.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Skills Showcase')),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: AdaptativeGridDelegate(
          minWidth: 100,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            elevation: 5,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: InkWell(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: item.route.name,
                        child: Image.network(item.image, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        height: 40,
                        color: Colors.black54,
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => _router.push(item.route),
              ),
            ),
          );
        },
      ),
    );
  }
}
