import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class TokenIsMissing extends BaseException {
  const TokenIsMissing()
      : super(
            message: 'No token in auth state was found',
            level: ExceptionLevel.unknown);
}
