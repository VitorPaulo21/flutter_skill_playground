import 'package:app/data/services/platform_service.dart';
import 'package:app/presentation/router/skill_route_information_parser.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:get_it/get_it.dart';
import 'data/services/logging_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerSingleton<SkillRouterDelegate>(SkillRouterDelegate());
  sl.registerSingleton<SkillRouteInformationParser>(
    SkillRouteInformationParser(),
  );
  sl.registerSingleton<LoggingService>(LoggingService());
  sl.registerSingleton<PlatformService>(PlatformService());
}
