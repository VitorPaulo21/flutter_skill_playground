import 'package:app/app_routes.dart';
import 'package:app/domain/models/card_item.dart';
import 'package:app/domain/components/grid_delegates/adaptative_grid_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<CardItem> items = [
    CardItem(
      title: 'CustomPainter Basics',
      route: RouteNames.CUSTOM_PAINTER_SCREEN,
      image: "https://i.ytimg.com/vi/kp14Y4uHpHs/maxresdefault.jpg",
    ),
    CardItem(
      title: 'Bloc State Management',
      route: RouteNames.BLOC_STATE_SCREEN,
      image:
          "https://codeclusive.io/blog/introduction-to-flutter-bloc/images/bloc.png",
    ),
    CardItem(
      title: 'Platform Channel Screen',
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
      title: 'Isolates Screen',
      route: RouteNames.ISOLATE_SCREEN,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIrU6ie-cYV4SqQvTc_YZJEwC5rYy2BUfJg&s",
    ),
    CardItem(
      title: 'Stream Builder Error Handler',
      route: RouteNames.STREAM_BUILDER_ERROR_SCREEN,
      image: "https://i.ytimg.com/vi/MkKEWHfy99Y/maxresdefault.jpg",
    ),
  ];

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
                      child: Image.network(item.image, fit: BoxFit.fitWidth),
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
                onTap: () => Get.toNamed(item.route.name),
              ),
            ),
          );
        },
      ),
    );
  }
}
