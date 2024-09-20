// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Schon ein Konto?"),
        "confirmPasswordHint":
            MessageLookupByLibrary.simpleMessage("Passwort bestätigen"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Erstellen Sie Ihr Konto"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage("Kein Konto?"),
        "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "emailHint": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "enterYourCred": MessageLookupByLibrary.simpleMessage(
            "Geben Sie Ihre Anmeldedaten ein, um sich anzumelden"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Passwort vergessen?"),
        "loading": MessageLookupByLibrary.simpleMessage("Wird geladen..."),
        "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "noGifsMessage":
            MessageLookupByLibrary.simpleMessage("Keine GIFs anzuzeigen"),
        "or": MessageLookupByLibrary.simpleMessage("Oder"),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Passwort"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Mit Google anmelden"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrieren"),
        "signUpButton": MessageLookupByLibrary.simpleMessage("Registrieren"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("Registrieren"),
        "title": MessageLookupByLibrary.simpleMessage("GiphyApp"),
        "trendingGifsTitle":
            MessageLookupByLibrary.simpleMessage("Beliebte GIFs"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Willkommen zurück")
      };
}
