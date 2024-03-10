import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidBinNumberException extends CustomException {
  InvalidBinNumberException()
      : super(
            120, 'invalid_bin_number', 'The BIN number is invalid or missing.');
}
