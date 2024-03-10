import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidEmailAddressException extends CustomException {
  InvalidEmailAddressException()
      : super(119, 'invalid_email_address', 'The Email Address is invalid or missing.');
}
