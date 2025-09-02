import 'package:get_it/get_it.dart';
import 'data/services/logging_service.dart'; // Exemplo de serviço singleton.

final sl = GetIt.instance;

void setupLocator() {
  sl.registerSingleton<LoggingService>(LoggingService());
}
