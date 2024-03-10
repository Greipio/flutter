import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidPhoneNumberException extends CustomException {
  InvalidPhoneNumberException()
      : super(118, 'invalid_phone_number',
            'The Phone Number is invalid or missing.');
}
