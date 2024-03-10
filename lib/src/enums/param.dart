// Dart Enum
enum Param {
  language,
  flag,
  currency,
  timezone,
  location,
  security,
  device,
}

extension ParamExtension on Param {
  String get value {
    switch (this) {
      case Param.language:
        return "language";
      case Param.flag:
        return "flag";
      case Param.currency:
        return "currency";
      case Param.timezone:
        return "timezone";
      case Param.location:
        return "location";
      case Param.security:
        return "security";
      case Param.device:
        return "device";
    }
  }

  static Param? fromValue(String value) {
    switch (value) {
      case "language":
        return Param.language;
      case "flag":
        return Param.flag;
      case "currency":
        return Param.currency;
      case "timezone":
        return Param.timezone;
      case "location":
        return Param.location;
      case "security":
        return Param.security;
      case "device":
        return Param.device;
      default:
        return null;
    }
  }

  static List<Param> values() {
    return Param.values;
  }
}
