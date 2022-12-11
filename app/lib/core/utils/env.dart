import '../generated/assets.gen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum _Environment {
  develop,
  stage,
  production,
}

_Environment _env = _Environment.develop;

class Env {
  static init() async {
    String? envPath;

    const envOverride = String.fromEnvironment("ENV");
    if (envOverride.isNotEmpty) {
      if (envOverride == "stage") {
        _env = _Environment.stage;
      } else if (envOverride == "production") {
        _env = _Environment.production;
      }
    }

    switch (_env) {
      case _Environment.develop:
        envPath = Assets.env.develop;
        break;
      case _Environment.stage:
        envPath = Assets.env.stage;
        break;
      case _Environment.production:
        envPath = Assets.env.production;
        break;
    }

    await dotenv.load(fileName: envPath);
  }

  static String get envName {
    return dotenv.env['ENVIRONMENT_NAME'] ?? 'unset';
  }

  static String get storagePrefix {
    return dotenv.env['STORAGE_PREFIX'] ?? 'unset';
  }

  static String get apiBaseUrl {
    return dotenv.env['API_BASE_URL'] ?? 'https://domain.com/api';
  }

  static String get mediaBaseUrl {
    return dotenv.env['MEDIA_BASE_URL'] ?? "https://api.bitpack.app";
  }

  static bool get debug {
    return dotenv.env['DEBUG'] == "true";
  }

  static String get appBaseUrl {
    return dotenv.env['APP_BASE_URL'] ?? "https://domain.com";
  }
}
