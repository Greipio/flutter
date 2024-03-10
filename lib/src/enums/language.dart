// Dart Enum
enum Language {
  ar,
  en,
  de,
  fr,
  es,
  ja,
  zh,
  ru,
}

extension LanguageExtension on Language {
  String get value {
    switch (this) {
      case Language.ar:
        return "AR";
      case Language.en:
        return "EN";
      case Language.de:
        return "DE";
      case Language.fr:
        return "FR";
      case Language.es:
        return "ES";
      case Language.ja:
        return "JA";
      case Language.zh:
        return "ZH";
      case Language.ru:
        return "RU";
    }
  }

  static Language? fromValue(String value) {
    switch (value) {
      case "AR":
        return Language.ar;
      case "EN":
        return Language.en;
      case "DE":
        return Language.de;
      case "FR":
        return Language.fr;
      case "ES":
        return Language.es;
      case "JA":
        return Language.ja;
      case "ZH":
        return Language.zh;
      case "RU":
        return Language.ru;
      default:
        return null;
    }
  }

  static List<Language> values() {
    return Language.values;
  }
}
