import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class SSOAuthenticationFailedException extends BaseException {
  const SSOAuthenticationFailedException()
      : super(
            message: 'Oops. Authentication failed. Try again later',
            level: ExceptionLevel.info);
}
