import 'package:flutter/material.dart';

class StreamStatusIndicator extends StatelessWidget {
  const StreamStatusIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final MaterialColor color = isActive ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(isActive ? Icons.play_arrow : Icons.stop, color: color),
          const SizedBox(width: 8),
          Text(
            isActive ? 'Stream ativo' : 'Stream finalizado',
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
