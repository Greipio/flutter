import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidModeException extends CustomException {
  InvalidModeException()
      : super(111, 'invalid_mode', 'The value of the mode parameter is not a valid format. Use test or live.');
}
