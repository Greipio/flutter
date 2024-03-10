import 'package:greip/src/exceptions/callback_not_allowd_exception.dart';
import 'package:greip/src/exceptions/custom_exception.dart';
import 'package:greip/src/exceptions/feature_not_available_exception.dart';
import 'package:greip/src/exceptions/flood_detected_exception.dart';
import 'package:greip/src/exceptions/inactive_user_exception.dart';
import 'package:greip/src/exceptions/invalid_asn_exception.dart';
import 'package:greip/src/exceptions/invalid_bin_number_exception.dart';
import 'package:greip/src/exceptions/invalid_callback_name_exception.dart';
import 'package:greip/src/exceptions/invalid_country_code_exception.dart';
import 'package:greip/src/exceptions/invalid_email_address_exception.dart';
import 'package:greip/src/exceptions/invalid_format_exception.dart';
import 'package:greip/src/exceptions/invalid_iban_exception.dart';
import 'package:greip/src/exceptions/invalid_ip_exception.dart';
import 'package:greip/src/exceptions/invalid_key_exception.dart';
import 'package:greip/src/exceptions/invalid_language_exception.dart';
import 'package:greip/src/exceptions/invalid_mode_exception.dart';
import 'package:greip/src/exceptions/invalid_phone_number_exception.dart';
import 'package:greip/src/exceptions/invalid_userid_exception.dart';
import 'package:greip/src/exceptions/plan_expired_exception.dart';
import 'package:greip/src/exceptions/security_module_not_allowed_exception.dart';
import 'package:greip/src/exceptions/domain_not_whitelisted_exception.dart';
import 'package:greip/src/exceptions/limit_reached_exception.dart';
import 'package:greip/src/exceptions/invalid_params_exception.dart';

class ExceptionHandler {
  static Exception handleException(dynamic e) {
    if (e is CustomException) {
      return exceptionByCode(e.code);
    } else {
      return e;
    }
  }

  static CustomException exceptionByCode(int code) {
    switch (code) {
      case 101:
        return InvalidKeyException();
      case 102:
        return InactiveUserException();
      case 103:
        return LimitReachedException();
      case 104:
        return InvalidParamsException();
      case 105:
        return PlanExpiredException();
      case 106:
        return FloodDetectedException();
      case 107:
        return InvalidCallbackNameException();
      case 108:
        return InvalidFormatException();
      case 109:
        return CallbackNotAllowedException();
      case 110:
        return InvalidLanguageException();
      case 111:
        return InvalidModeException();
      case 112:
        return InvalidIpException();
      case 113:
        return DomainNotWhitelistedException();
      case 114:
        return SecurityModuleNotAllowedException();
      case 116:
        return InvalidCountryCodeException();
      case 117:
        return FeatureNotAvailableException();
      case 118:
        return InvalidPhoneNumberException();
      case 119:
        return InvalidEmailAddressException();
      case 120:
        return InvalidBinNumberException();
      case 121:
        return InvalidAsnException();
      case 122:
        return InvalidIbanException();
      case 123:
        return InvalidUseridException();
      default:
        return CustomException(code, 'unknown_error', 'Unknown error occurred.');
    }
  }
}
