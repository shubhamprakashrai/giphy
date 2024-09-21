import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/services/language_service.dart';
import 'package:giphyapp/app/services/storage_service.dart';
import 'package:giphyapp/firebase_options.dart';
import 'package:giphyapp/generated/l10n.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  StorageService.service.init();
  AppLanguageService.services.init();
  runApp(
    ValueListenableBuilder(
        valueListenable: AppLanguageService.services.languageChange,
        builder: (context, value, child) {
          log.w("Rebuild Sensesssssss");
          return GetMaterialApp(
            title: "GiphyApp",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            locale: value,
            onGenerateTitle: (context) => S.of(context).title,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        }
      ),
  );
}
