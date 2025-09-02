import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<String> getPlatformVersion() async {
    try {
      final String? version = await platform.invokeMethod<String>(
        'getPlatformVersion',
      );
      return version ?? 'Unknown version';
    } on PlatformException catch (e) {
      return 'Failed: ${e.message}';
    }
  }
}
