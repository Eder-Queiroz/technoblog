import 'package:mobile/utils/exception/app_exception.dart';

class BadRequestException extends AppException {
  BadRequestException(super.message, [super.stackTrace]);
}
