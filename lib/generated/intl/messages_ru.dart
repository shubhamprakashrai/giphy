// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт?"),
        "confirmPasswordHint":
            MessageLookupByLibrary.simpleMessage("Подтвердите пароль"),
        "createAccount": MessageLookupByLibrary.simpleMessage(
            "Создайте свою учетную запись"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "enterYourCred": MessageLookupByLibrary.simpleMessage(
            "Введите свои данные для входа"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "noGifsMessage":
            MessageLookupByLibrary.simpleMessage("Нет GIF для отображения"),
        "or": MessageLookupByLibrary.simpleMessage("Или"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Пароль"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Войти через Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "signUpButton":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "title": MessageLookupByLibrary.simpleMessage("GiphyApp"),
        "trendingGifsTitle":
            MessageLookupByLibrary.simpleMessage("Популярные GIF"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Добро пожаловать")
      };
}
