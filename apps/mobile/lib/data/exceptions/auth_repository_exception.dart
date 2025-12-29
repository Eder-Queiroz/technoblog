import 'package:mobile/utils/exception/app_exception.dart';

class MissingIdTokenException extends AppException {
  MissingIdTokenException(super.message, [super.stackTrace]);
}
