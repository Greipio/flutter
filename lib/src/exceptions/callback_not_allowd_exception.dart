import 'package:greip/src/exceptions/custom_exception.dart';

class CallbackNotAllowedException extends CustomException {
  CallbackNotAllowedException()
      : super(109, 'callback_not_allowd', 'You can use the callback feature only with the JSON format.');
}
