import 'package:mobile/utils/exception/app_exception.dart';

class ForbiddenException extends AppException {
  ForbiddenException(super.message, [super.stackTrace]);
}
