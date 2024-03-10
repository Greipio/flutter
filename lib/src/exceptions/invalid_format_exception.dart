import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidFormatException extends CustomException {
  InvalidFormatException()
      : super(108, 'invalid_format',
            'The value of the format parameter is not a valid format. Use JSON, XML or Newline.');
}
