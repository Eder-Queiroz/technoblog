import 'package:mobile/utils/exception/app_exception.dart';

class NotFoundException extends AppException {
  NotFoundException(super.message, [super.stackTrace]);
}
