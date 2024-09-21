// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Vous avez déjà un compte?"),
        "confirmPasswordHint":
            MessageLookupByLibrary.simpleMessage("Confirmer le mot de passe"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Créez votre compte"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Vous n\'avez pas de compte?"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailHint": MessageLookupByLibrary.simpleMessage("E-mail"),
        "enterYourCred": MessageLookupByLibrary.simpleMessage(
            "Entrez vos identifiants pour vous connecter"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe oublié?"),
        "loading": MessageLookupByLibrary.simpleMessage("Chargement..."),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
        "noGifsMessage":
            MessageLookupByLibrary.simpleMessage("Aucun GIF à afficher"),
        "or": MessageLookupByLibrary.simpleMessage("Ou"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Se connecter avec Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "signUpButton": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "title": MessageLookupByLibrary.simpleMessage("GiphyApp"),
        "trendingGifsTitle":
            MessageLookupByLibrary.simpleMessage("GIFs populaires"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Bon retour")
      };
}
