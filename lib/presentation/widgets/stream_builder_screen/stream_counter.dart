import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StreamCounter extends StatelessWidget {
  const StreamCounter({super.key, required this.value});

  final int value;

  Color _getDataColor(int data) {
    if (data % 2 == 0) return Colors.blue;
    if (data % 3 == 0) return Colors.green;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Número recebido:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Gap(8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _getDataColor(value),
            shape: BoxShape.circle,
          ),
          child: Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(8),
        Text(
          'Dados fluindo normalmente',
          style: const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
