import 'package:mobile/utils/exception/app_exception.dart';

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message, [super.stackTrace]);
}
