import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class ReadingFromSecureStorageException extends BaseException {
  const ReadingFromSecureStorageException()
      : super(
            message: 'Reading from encrypted secure storage failed',
            level: ExceptionLevel.fatal);
}
