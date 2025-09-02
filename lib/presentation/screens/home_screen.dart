import 'package:app/app_routes.dart';
import 'package:app/domain/models/card_item.dart';
import 'package:app/domain/components/grid_delegates/adaptative_grid_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importe as telas.

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Skills Showcase')),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: AdaptativeGridDelegate(minWidth: 100, crossAxisCount: 2),
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
                        alignment: Alignment.center,
                        height: 40,
                        color: Colors.black54,
                        child: Text(
                          item.title,
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
