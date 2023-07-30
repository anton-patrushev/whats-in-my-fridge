import 'package:whats_in_my_fridge/src/shared/core/errors/common/exception_level.dart';

class BaseException {
  const BaseException(
      {required this.message, this.level = ExceptionLevel.unknown});

  final String message;
  final ExceptionLevel level;
}
