import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class UserCanceledOperationException extends BaseException {
  const UserCanceledOperationException(
      {this.specificMessage = 'User canceled operation'})
      : super(message: specificMessage, level: ExceptionLevel.info);

  final String specificMessage;
}
