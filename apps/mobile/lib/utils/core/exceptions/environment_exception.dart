import 'package:mobile/utils/exception/app_exception.dart';

class EnvironmentException extends AppException {
  EnvironmentException(super.message, [super.stackTrace]);

  @override
  String toString() => 'EnvironmentException: $message';
}
