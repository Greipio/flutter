import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidUseridException extends CustomException {
  InvalidUseridException()
      : super(123, 'invalid_userid',
            'The user identifier is invalid or too long.');
}
