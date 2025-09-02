import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Performance Screen')),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: 1000,
        itemBuilder: (context, index) {
          final int itemNumber = index + 1;
          return RepaintBoundary(
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text('Item $itemNumber'),
                leading: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: FittedBox(
                    child: Text(
                      '#$itemNumber',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
