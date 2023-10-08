import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class SessionWasNotPersistedException extends BaseException {
  const SessionWasNotPersistedException()
      : super(
            message: 'No token in secure storage was found',
            level: ExceptionLevel.debug);
}
