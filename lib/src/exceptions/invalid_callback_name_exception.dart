import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidCallbackNameException extends CustomException {
  InvalidCallbackNameException()
      : super(107, 'invalid_callback_name', 'The value of the callback parameter cannot be a function name.');
}
