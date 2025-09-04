import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../locator.dart'; // Importe o sl (GetIt).
import '../../data/services/logging_service.dart';

class DependencyInjectionScreen extends StatelessWidget {
  const DependencyInjectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loggingService = sl<LoggingService>();

    return Scaffold(
      appBar: AppBar(title: Text('Dependency Injection')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox.shrink()),
            Text('Serviço Injetado via GetIt'),
            ElevatedButton(
              onPressed: () {
                loggingService.logMessage('Mensagem logada da tela DI!');
              },
              child: Text('Logar Mensagem'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                loggingService.clearMessages();
              },
              label: Text('Limpar'),
              icon: Icon(Icons.clear_outlined),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: GetBuilder(
                    init: loggingService,
                    builder: (controller) {
                      return ListView.builder(
                        padding: EdgeInsets.all(15),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final String message = controller.messages[index];
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                message,
                                style: GoogleFonts.kodeMono(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
