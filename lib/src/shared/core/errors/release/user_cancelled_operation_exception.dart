import 'package:whats_in_my_fridge/src/shared/core/errors/common/base_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class UserCanceledOperaionException extends BaseException {
  const UserCanceledOperaionException(
      {this.specificMessage = 'User canceled operation'})
      : super(message: specificMessage, level: ExceptionLevel.info);

  final String specificMessage;
}
