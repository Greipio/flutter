// Dart Enum
enum Mode {
  live,
  development,
}

extension ModeExtension on Mode {
  String get value {
    switch (this) {
      case Mode.live:
        return "live";
      case Mode.development:
        return "test";
    }
  }

  static Mode? fromValue(String value) {
    switch (value) {
      case "live":
        return Mode.live;
      case "test":
        return Mode.development;
      default:
        return null;
    }
  }

  static List<Mode> values() {
    return Mode.values;
  }
}
