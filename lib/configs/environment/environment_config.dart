import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvironmentType { development, release }

extension EnviromentUtilities on EnvironmentType {
  static EnvironmentType parseRawStringEnviroment(String rawEnv) {
    if (rawEnv == 'production') return EnvironmentType.release;

    return EnvironmentType.development;
  }
}

@immutable
class EnvironmentConfig {
  final EnvironmentType enviroment =
      EnviromentUtilities.parseRawStringEnviroment(dotenv.get('ENVIRONMENT'));
  final bool isDebug = bool.parse(dotenv.get('DEBUG', fallback: 'false'));
}

class Enviroment {
  static const _envFileName = 'lib/configs/environment/env/.env';

  static Future<void> init() async {
    await dotenv.load(fileName: _envFileName);
  }

  static void buildConfig() {
    config = EnvironmentConfig();
  }

  static late final EnvironmentConfig config;
}
