import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class WritingToSecureStorageException extends BaseException {
  const WritingToSecureStorageException()
      : super(
            message: 'Writing to encrypted secure storage failed',
            level: ExceptionLevel.fatal);
}
