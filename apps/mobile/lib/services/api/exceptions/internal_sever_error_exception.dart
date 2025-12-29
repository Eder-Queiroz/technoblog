import 'package:mobile/utils/exception/app_exception.dart';

class InternalServerErrorException extends AppException {
  InternalServerErrorException(super.message, [super.stackTrace]);
}
