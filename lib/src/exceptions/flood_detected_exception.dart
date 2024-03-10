import 'package:greip/src/exceptions/custom_exception.dart';

class FloodDetectedException extends CustomException {
  FloodDetectedException()
      : super(106, 'flood_detected', 'Our system has detected too many requests at the same time. Kindly please try to slow down.');
}
