// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("すでにアカウントをお持ちですか？"),
        "confirmPasswordHint": MessageLookupByLibrary.simpleMessage("パスワードを確認"),
        "createAccount": MessageLookupByLibrary.simpleMessage("アカウントを作成"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("アカウントをお持ちではありませんか？"),
        "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "emailHint": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "enterYourCred":
            MessageLookupByLibrary.simpleMessage("ログインするには、資格情報を入力してください"),
        "forgetPassword": MessageLookupByLibrary.simpleMessage("パスワードをお忘れですか？"),
        "loading": MessageLookupByLibrary.simpleMessage("読み込み中..."),
        "login": MessageLookupByLibrary.simpleMessage("ログイン"),
        "noGifsMessage": MessageLookupByLibrary.simpleMessage("表示するGIFがありません"),
        "or": MessageLookupByLibrary.simpleMessage("または"),
        "password": MessageLookupByLibrary.simpleMessage("パスワード"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("パスワード"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Googleでサインイン"),
        "signUp": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "signUpButton": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "title": MessageLookupByLibrary.simpleMessage("GiphyApp"),
        "trendingGifsTitle": MessageLookupByLibrary.simpleMessage("人気のGIF"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("お帰りなさい")
      };
}
