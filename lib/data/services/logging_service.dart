import 'dart:developer';

import 'package:get/get.dart';

class LoggingService extends GetxController {
  final List<String> _messages = [];

  List<String> get messages => [..._messages];

  void logMessage(String message) {
    _messages.add(message);
    log('LOG: $message');
    update();
  }

  void clearMessages() {
    _messages.clear();
    update();
  }
}
