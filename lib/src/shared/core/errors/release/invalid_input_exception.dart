import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class InvalidInputException extends BaseException {
  const InvalidInputException(String message)
      : super(message: message, level: ExceptionLevel.info);
}
