import 'package:mobile/utils/exception/app_exception.dart';

class LocalStorageException extends AppException {
  LocalStorageException(super.message, [super.stackTrace]);
}

class LocalStorageUnsupportedTypeException extends LocalStorageException {
  LocalStorageUnsupportedTypeException(super.message, [super.stackTrace]);
}

class LocalStorageTypeMismatchException extends LocalStorageException {
  LocalStorageTypeMismatchException(super.message, [super.stackTrace]);
}
