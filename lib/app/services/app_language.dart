import 'dart:ui' as ui;

enum AppLanguage {
  english("en", "English"),
  arabic("ar", "العربية"),
  spanish("es", "Español"),
  hindi("hi", "हिन्दी"),
  urdu("ur", "اردو"),
  chinese("zh", "中文"),
  french("fr", "Français"),
  german("de", "Deutsch"),
  japanese("ja", "日本語"),
  korean("ko", "한국어"),
  russian("ru", "Русский"),
  portuguese("pt", "Português"),
  turkish("tr", "Türkçe"),
  indonesian("id", "Bahasa Indonesia");

  /// Returns the text direction for the language.
  ui.TextDirection get direction {

    switch (this) {
      case AppLanguage.arabic:
      case AppLanguage.urdu:
        return ui.TextDirection.rtl;
      default:
        return ui.TextDirection.ltr;
    }
  }

  final String code;
  final String language;

  const AppLanguage(this.code, this.language);

  /// Converts a string to an AppLanguage enum value.
  /// Returns [AppLanguage.english] if the string is null, empty, or does not match any defined language.
  factory AppLanguage.fromString(String? languageCode) {
    if (languageCode == null || languageCode.isEmpty) {
      return AppLanguage.english;
    }
    return AppLanguage.values.firstWhere((lang) => lang.code == languageCode, orElse: () => AppLanguage.english);
  }

}