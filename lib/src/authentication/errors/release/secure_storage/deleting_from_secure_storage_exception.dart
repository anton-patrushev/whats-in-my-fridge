import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class DeletingFromSecureStorageException extends BaseException {
  const DeletingFromSecureStorageException()
      : super(
            message: 'Delete from encrypted secure storage failed',
            level: ExceptionLevel.fatal);
}
