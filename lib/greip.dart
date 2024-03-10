library greip;

import 'package:greip/src/enums/language.dart';
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/param.dart';
import 'package:greip/src/helpers/api_service.dart';

// The main class of the package
class Greip {
  // Greip API's base URL
  String baseUrl = "https://gregeoip.com";
  // Initialize the API Token
  String? token;

  /// Greip Constructor
  Greip({this.token});

  /// Sets the API Token so you can use the package methods.
  ///
  /// Parameters:
  ///   - [token]: The API Token you get from the Greip Dashboard, [learn more](https://docs.greip.io/dashboard-guides/account-management/obtaining-api-key).
  void setToken(String token) {
    this.token = token;
  }

  /// Email Validation Method
  ///
  /// This method provides an additional layer of validation for your system. While validating email syntax is important, it is not sufficient. This method goes beyond syntax validation by checking the domain’s validity, the availability of the Mail Service, detecting Disposable Email (Temporary Emails), etc. By utilising this method, you can ensure a more thorough validation process for email addresses.
  ///
  /// Parameters:
  ///   - [email]: The email address you want to validate.
  ///   - [userID]: The User Identifier. [Learn More](https://docs.greip.io/options/user-identifier).
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the response from the API.
  ///   For successful validation, the map will contain details about the email.
  ///   For unsuccessful validation, the map will contain error details.
  ///
  /// See [Email Validation API Reference](https://docs.greip.io/api-reference/endpoint/data-validation/email-lookup)
  Future<Map<String, dynamic>> validateEmail(
    String email, {
    String? userID,
    Mode mode = Mode.live, // Default mode to live
  }) async {
    assert(token != null);

    // Convert email and mode to lowercase
    email = email.toLowerCase();

    // Validate mode
    if (Mode.values.contains(mode) == false) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    // Prepare request parameters
    final Map<String, dynamic> localParams = {
      'email': email,
      'userID': userID,
      'mode': mode.value,
      'source': 'Flutter-SDK',
    };

    var uri = Uri.parse('$baseUrl/validateEmail');

    return APIService.instance
        .getMethod(uri: uri, token: token!, query: localParams);
  }

  /// Phone Validation Method
  ///
  /// This method can be used as an extra-layer of your system for validating phone numbers. It validates phone number syntax and valid-possibility.
  ///
  /// Parameters:
  ///   - [phone]: The phone number you want to validate (without international country code).
  ///   - [countryCode]: The `ISO 3166-1 alpha-2` code format of the user. [Learn More](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
  ///   - [userID]: The User Identifier. [Learn More](https://docs.greip.io/options/user-identifier).
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the response from the API.
  ///   For successful validation, the map will contain the validation details of the provided phone number.
  ///   For unsuccessful validation, the map will contain error details.
  ///
  /// See [Phone Number Validation Reference](https://docs.greip.io/api-reference/endpoint/data-validation/phone-lookup)
  Future<Map<String, dynamic>> validatePhone(
    String phone,
    String countryCode, {
    String? userID,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    phone = phone.toLowerCase();
    countryCode = countryCode.toUpperCase();

    if (countryCode.isEmpty) {
      throw Exception(
          'The countryCode parameter is required. You passed an empty value.');
    }

    if (phone.isEmpty) {
      throw Exception(
          'The phone parameter is required. You passed an empty value.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final Map<String, dynamic> localParams = {
      'phone': phone,
      'countryCode': countryCode,
      'userID': userID,
      'mode': mode.value,
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/validatePhone'),
        token: token!,
        query: localParams);
  }

  /// IBAN Validation Method
  ///
  /// Validates the provided IBAN (International Bank Account Number) and retrieve additional information about the country associated with the IBAN.
  ///
  /// Parameters:
  ///   - [iban]: The IBAN you want to validate.
  ///   - [userID]: The User Identifier. [Learn More](https://docs.greip.io/options/user-identifier).
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the response from the API.
  ///   For successful validation, the map will contain details about the IBAN.
  ///   For unsuccessful validation, the map will contain error details.
  ///
  /// See [IBAN Validation API Reference](https://docs.greip.io/api-reference/endpoint/payment-fraud/iban-validation)
  Future<Map<String, dynamic>> validateIban(
    String iban, {
    String? userID,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    iban = iban.toUpperCase();

    if (iban.isEmpty) {
      throw Exception(
          'The IBAN parameter is required. You passed an empty value.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final Map<String, dynamic> localParams = {
      'iban': iban,
      'userID': userID,
      'mode': mode.value,
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/validateIBAN'),
        token: token!,
        query: localParams);
  }

  /// IPs Bulk lookup Method
  ///
  /// Looks up the provided IP Addresses for information.
  ///
  /// Parameters:
  ///   - [ips]: The IP addresses you want to lookup.
  ///   - [params]: You can pass the modules you want to fetch for that IP. This list accepts `location`, `security`, `timezone`, `currency`, and/or `device`.
  ///   - [lang]: Sets the output language. It can be `EN`, `AR`, `DE`, `FR`, `ES`, `JA`, `ZH`, or `RU`.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the geolocation data of the given IP addresses.
  ///   For successful lookup, the map will contain details about the IP geolocation.
  ///   For unsuccessful lookup, the map will contain error details.
  ///
  /// See [Bulk IP Lookup API Reference](https://docs.greip.io/api-reference/endpoint/ip-geolocation/bulk-lookup)
  Future<Map<String, dynamic>> bulkLookup(
    List<String>? ips, {
    List<Param> params = const [],
    Language lang = Language.en,
    Mode mode = Mode.live,
  }) async {
    if (ips == null || ips.isEmpty) {
      throw Exception('You should pass the `ips` parameter.');
    }

    if (!Language.values.contains(lang)) {
      throw Exception('The language you specified ($lang) is unknown.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }
    final tempParams = params.map((param) => param.value).toList();
    final tempParamsString = tempParams.join(',');
    final localParams = {
      'ips': ips,
      'lang': lang.value.toUpperCase(),
      'params': tempParamsString,
      'mode': mode.value.toLowerCase(),
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/BulkLookup'),
        token: token!,
        query: localParams);
  }

  /// Profanity Detection Method
  ///
  /// Checks the provided text for profanity.
  ///
  /// Parameters:
  ///   - [text]: The text you want to check for profanity.
  ///   - [listBadWords]: Set to `true` to list the detected words and phrases as an Array.
  ///   - [scoreOnly]: Set to `true` if your want to return only the score of the text and whether it's safe or not.
  ///   - [userID]: The User Identifier. [Learn More](https://docs.greip.io/options/user-identifier).
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the response from the API.
  ///   For successful detection, the map will contain some analytics of the given text.
  ///   For unsuccessful detection, the map will contain error details.
  ///
  /// See [Profanity Detection API Reference](https://docs.greip.io/api-reference/endpoint/other-services/profanity-detection)
  Future<Map<String, dynamic>> profanity(
    String text, {
    bool listBadWords = false,
    bool scoreOnly = false,
    String? userID,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    if (text.isEmpty) {
      throw Exception(
          'The text parameter is required. You passed an empty value.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final Map<String, dynamic> localParams = {
      'text': text,
      'listBadWords': listBadWords ? 'yes' : 'no',
      'scoreOnly': scoreOnly ? 'yes' : 'no',
      'userID': userID,
      'mode': mode.value,
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/badWords'), token: token!, query: localParams);
  }

  /// Payment Fraud Prevention Method
  ///
  /// Prevents payment fraud by analyzing the provided transaction information using AI-Powered modules.
  ///
  /// Parameters:
  ///   - [data]: The information of the transaction.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the response from the API.
  ///   For successful request, the map will contain details about the transaction analysis.
  ///   For unsuccessful request, the map will contain error details.
  ///
  /// See [Payment Fraud Prevention API Reference](https://docs.greip.io/api-reference/endpoint/payment-fraud/payment-fraud-prevention)
  Future<Map<String, dynamic>> paymentFraud(
    Map<String, dynamic> data, {
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    if (data.isEmpty) {
      throw Exception(
          'The data parameter is required. You passed an empty value.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final Map<String, dynamic> localParams = {
      'mode': mode.value,
      'source': 'Flutter-SDK',
      'data': data,
    };

    return APIService.instance.postMethod(
        uri: Uri.parse('$baseUrl/paymentFraud'),
        token: token!,
        data: localParams);
  }

  /**
   * GeoIP Methods
   *
   * These Methods will help you use the functionalities of Greip IP Geolocation & Country API
   * For more information please check out https://docs.greip.io
   *
   */

  /// IP Geolocation Method
  ///
  /// Use this method to retrieve the IP Address of the visitor/user with its full information.
  ///
  /// Parameters:
  ///   - [params]: You can pass the modules you want to fetch for that IP. This list accepts `location`, `security`, `timezone`, `currency`, and/or `device`.
  ///   - [lang]: Sets the output language. It can be `EN`, `AR`, `DE`, `FR`, `ES`, `JA`, `ZH`, or `RU`.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the `production` mode.
  ///
  /// Returns:
  ///   A Map representing the geolocation information for the visitor/user IP address.
  ///   For successful lookup, the map will contain the information of the visitor/user IP address.
  ///   For unsuccessful lookup, the map will contain error details.
  ///
  /// See [GeoIP API Reference](https://docs.greip.io/api-reference/endpoint/ip-geolocation/geoip)
  Future<Map<String, dynamic>> geoIp({
    List<Param> params = const [],
    Language lang = Language.en,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    final tempParams = params.map((param) => param.value).toList();
    final tempParamsString = tempParams.join(',');

    if (!Language.values.contains(lang)) {
      throw Exception('The language you specified ($lang) is unknown.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final localParams = {
      'lang': lang.value.toUpperCase(),
      'params': tempParamsString,
      'mode': mode.value.toLowerCase(),
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/GeoIP'), token: token!, query: localParams);
  }

  /// Free Get-IP Method
  ///
  /// This method can be used without having an account/API-key at Greip. Please feel free to use it if you want to get only the IP address of your visitors/users
  ///
  /// Returns:
  ///   A Map contains the IP address of the visitor/user.
  ///   For successful request, the map will contain the IP address of the visitor/user.
  ///   For unsuccessful request, the map will contain error details.
  ///
  /// See [Free Get-IP API Reference](https://docs.greip.io/api-reference/endpoint/ip-geolocation/free-get-ip-method)
  Future<Map<String, dynamic>> ip() async {
    return APIService.instance
        .getMethod(uri: Uri.parse('$baseUrl/ip'), token: '');
  }

  /// IP Lookup Method
  ///
  /// Looks up any given IP address.
  ///
  /// Parameters:
  ///   - [ip]: The IP address you want to lookup.
  ///   - [params]: You can pass the modules you want to fetch for that IP address. This list accepts `location`, `security`, `timezone`, `currency`, and/or `device`.
  ///   - [lang]: Sets the output language. It can be `EN`, `AR`, `DE`, `FR`, `ES`, `JA`, `ZH`, or `RU`.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the production mode.
  ///
  /// Returns:
  ///   A Map representing the geolocation information for the given IP address.
  ///   For successful lookup, the map will contain the information of the given IP address.
  ///   For unsuccessful lookup, the map will contain error details.
  ///
  /// See [IP Geolocation API Reference](https://docs.greip.io/api-reference/endpoint/ip-geolocation/ip-lookup)
  Future<Map<String, dynamic>> ipLookup(
    String ip, {
    List<Param> params = const [],
    Language lang = Language.en,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    ip = ip.toUpperCase();

    if (ip.isEmpty) {
      throw Exception(
          'The ip parameter is required. You passed an empty value.');
    }

    final tempParams = params.map((param) => param.value).toList();
    final tempParamsString = tempParams.join(',');

    if (!Language.values.contains(lang)) {
      throw Exception('The language you specified ($lang) is unknown.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final localParams = {
      'ip': ip,
      'lang': lang.value.toUpperCase(),
      'params': tempParamsString,
      'mode': mode.value.toLowerCase(),
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/IPLookup'), token: token!, query: localParams);
  }

  /// Country Lookup Method
  ///
  /// Retrieves information about a country using its `ISO 3166-1 alpha-2` code format.
  ///
  /// Parameters:
  ///   - [countryCode]: The `ISO 3166-1 alpha-2` code format of the country.
  ///   - [params]: This is used to determine the data you need in the response. Accepts: `language`, `flag`, `currency`, and/or `timezone`.
  ///   - [lang]: Sets the output language. It can be `EN`, `AR`, `DE`, `FR`, `ES`, `JA`, `ZH`, or `RU`.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the production mode.
  ///
  /// Returns:
  ///   A Map containing country information.
  ///   For successful request, the map will contain the information of the given country.
  ///   For unsuccessful request, the map will contain error details.
  ///
  /// Throws:
  ///   [Exception] if the [countryCode] parameter is empty or invalid.
  ///   [Exception] if the [language] or [mode] specified is unknown.
  ///
  /// See [Country Data API Reference](https://docs.greip.io/api-reference/endpoint/other-services/country-data)
  Future<Map<String, dynamic>> countryLookup(
    String countryCode, {
    List<Param> params = const [],
    Language lang = Language.en,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    countryCode = countryCode.toUpperCase();

    if (countryCode.isEmpty) {
      throw Exception(
          'The countryCode parameter is required. You passed an empty value.');
    }

    final tempParams = params.map((param) => param.value).toList();
    final tempParamsString = tempParams.join(',');

    if (!Language.values.contains(lang)) {
      throw Exception('The language you specified ($lang) is unknown.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final localParams = {
      'CountryCode': countryCode,
      'params': tempParamsString,
      'lang': lang.value.toUpperCase(),
      'mode': mode.value.toLowerCase(),
      'source': 'Flutter-SDK',
    };

    return APIService.instance.getMethod(
        uri: Uri.parse('$baseUrl/Country'), token: token!, query: localParams);
  }

  /// ASN Lookup Method
  ///
  /// Retrieves information about the Autonomous System (AS) using its AS Number.
  ///
  /// Parameters:
  ///   - [asn]: The AS Number you want to lookup.
  ///   - [isList]: Set this to `true` if you want the method to return all IPv4 & IPv6 routes.
  ///   - [mode]: You pass `test` to this variable, so your account plan will not be affected while integrating the package will return fake information. You can set it to `live` again to back to the production mode.
  ///
  /// Returns:
  ///   A Map containing ASN data.
  ///
  /// Throws:
  ///   Exception if the [asn] parameter is empty.
  ///   Exception if the [mode] specified is unknown.
  ///
  /// See [ASN Lookup API Reference](https://docs.greip.io/api-reference/endpoint/ip-geolocation/asn-lookup)
  Future<Map<String, dynamic>> asnLookup(
    String asn, {
    bool isList = false,
    Mode mode = Mode.live,
  }) async {
    assert(token != null);

    asn = asn.toUpperCase();

    if (asn.isEmpty) {
      throw Exception(
          'The asn parameter is required. You passed an empty value.');
    }

    if (!Mode.values.contains(mode)) {
      throw Exception(
          'The mode you specified ($mode) is unknown. You should use `live` or `test`.');
    }

    final localParams = {
      'asn': asn,
      'isList': isList ? 'yes' : 'no',
      'mode': mode.value.toLowerCase(),
      'source': 'Flutter-SDK',
    };

    var uri = Uri.parse('$baseUrl/ASNLookup');

    return APIService.instance
        .getMethod(uri: uri, token: token!, query: localParams);
  }
}
