import 'package:greip/src/exceptions/custom_exception.dart';

class InactiveUserException extends CustomException {
  InactiveUserException()
      : super(102, 'inactive_user', 'The API Key owner (the account) is inactive right now. Please contact the support team for more information.');
}
