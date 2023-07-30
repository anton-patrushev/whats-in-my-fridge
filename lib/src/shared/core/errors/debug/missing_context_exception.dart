import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class MissingContextException extends BaseException {
  const MissingContextException(String message)
      : super(message: message, level: ExceptionLevel.debug);
}
