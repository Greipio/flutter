import 'package:greip/src/exceptions/custom_exception.dart';

class FeatureNotAvailableException extends CustomException {
  FeatureNotAvailableException()
      : super(117, 'feature_not_available',
            'This feature is not available for your plan, please upgrade your plan first.');
}
