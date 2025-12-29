import 'package:mobile/utils/core/exceptions/environment_exception.dart';

class Environment {
  Environment._();

  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  // ============================================================================
  // APP CONFIGURATION
  // ============================================================================

  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );

  static const bool enableLogs = bool.fromEnvironment(
    'ENABLE_LOGS',
    defaultValue: true,
  );

  // ============================================================================
  // THIRD PARTY CONFIGURATION
  // ============================================================================

  static const String googleClientId = String.fromEnvironment(
    'GOOGLE_CLIENT_ID',
  );

  static const String googleServerClientId = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
  );

  static void validate() {
    final errors = <String>[];

    if (apiBaseUrl.isEmpty) {
      errors.add('API_BASE_URL is required');
    }

    if (googleClientId.isEmpty) {
      errors.add('GOOGLE_CLIENT_ID is required');
    }

    if (googleServerClientId.isEmpty) {
      errors.add('GOOGLE_SERVER_CLIENT_ID is required');
    }

    if (errors.isNotEmpty) {
      throw EnvironmentException(
        'Environment validation failed:\n${errors.join('\n')}',
      );
    }
  }
}
