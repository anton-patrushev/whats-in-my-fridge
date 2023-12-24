import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class FailedToSaveUserException extends BaseException {
  const FailedToSaveUserException()
      : super(
            message: 'Oops. Something went wrong. Failed to save user',
            level: ExceptionLevel.info);
}
