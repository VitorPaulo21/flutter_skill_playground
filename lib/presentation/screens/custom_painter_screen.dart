import 'package:app/presentation/widgets/exagon_widget.dart';
import 'package:flutter/material.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustomPainter Screen")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ExagonWidget(color: Color(0xFFD0E4F9), radius: 100),
                Positioned(
                  left: 25,
                  right: 25,
                  bottom: 30,
                  child: ExagonWidget(color: Color(0xFF579CE9), radius: 50),
                ),
                Positioned(
                  left: 25,
                  right: 25,
                  top: 25,
                  child: ExagonWidget(color: Color(0xC0076DDD), radius: 35),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    "for people",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Color(0xFF076DDD),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    "SOFTWARES",
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF076DDD),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
