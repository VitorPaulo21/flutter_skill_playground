import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamErrorHandlerWidget extends StatelessWidget {
  const StreamErrorHandlerWidget({
    super.key,
    required this.stackTrace,
    required this.error,
  });

  final StackTrace? stackTrace;
  final dynamic error;

  String _getUserFriendlyError(Object error) {
    if (error is FormatException) {
      return 'Os dados recebidos estão em um formato inválido.';
    } else if (error is StateError) {
      return 'A transmissão de dados foi finalizada.';
    }
    return 'Encontramos um problema temporário. Tente novamente em alguns instantes.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 64, color: Colors.red),
        Gap(16),
        Text(
          'Oops! Algo deu errado',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(8),
        Text(
          _getUserFriendlyError(error),
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Gap(16),
        if (stackTrace != null) ...[
          const Text(
            'Detalhes técnicos (debug):',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Gap(8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              error.toString(),
              style: GoogleFonts.firaCode(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }
}
