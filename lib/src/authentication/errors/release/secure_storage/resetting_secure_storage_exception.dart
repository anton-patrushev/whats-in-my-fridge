import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class ResettingSecureStorageException extends BaseException {
  const ResettingSecureStorageException()
      : super(
            message: 'Resetting encrypted secure storage failed',
            level: ExceptionLevel.fatal);
}
