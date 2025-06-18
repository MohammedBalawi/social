import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/libs/dataproviders/dataproviders.dart';
import 'package:marrige_app/libs/debug_it.dart';

// Language Event
abstract class LanguageEvent {}

class SetLanguage extends LanguageEvent {
  final Locale locale;
  SetLanguage(this.locale);
}

class LoadLanguage extends LanguageEvent {}

// Language State
class LanguageState {
  final Locale locale;
  const LanguageState({required this.locale});
}

// Language BLoC
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final KeyValueStorage keyValueStorage;
  final String _tag = "LanguageBloc";

  LanguageBloc(this.keyValueStorage)
      : super(const LanguageState(locale: Locale('en'))) {
    on<SetLanguage>((event, emit) async {
      emit(LanguageState(locale: event.locale));
      final langCode = event.locale.languageCode;
      DebugIT.printLog(_tag, 'Change language of tha app to $langCode');

      // Store the selected language in shared preferences
      keyValueStorage.setLanguage(langCode);
      AppConfig.appLang = langCode;
      DebugIT.printLog(_tag, 'AppConfig.appLang is ${AppConfig.appLang}');
    });

    /*
    عند اول تحميل  - يتم فحص اي لغات مخزنة مسبقا واللغة الافتراضية
     */

    on<LoadLanguage>(
      (event, emit) async {
        // Load language from shared preferences, if null fallback to system locale
        String? storedLanguage = await keyValueStorage.getSelectedLanguage();
        DebugIT.printLog(
            _tag, 'check if there language saved in shared preference');

        if (storedLanguage != null) {
          emit(
            LanguageState(
              locale: Locale(storedLanguage),
            ),
          );
          DebugIT.printLog(_tag,
              'set the app language storedLanguage in shared preference $storedLanguage that it is value not null ');
          AppConfig.appLang = storedLanguage;
        } else {
          Locale systemLocale = PlatformDispatcher.instance.locales.first;
          List<Locale> supportedLocales = AppConfig.supportedLocales
              .map((lang) => lang['locale'] as Locale)
              .toList();

          bool isSupported = supportedLocales.any(
              (locale) => locale.languageCode == systemLocale.languageCode);
          DebugIT.printLog(_tag, 'Is device locale supported? $isSupported');

          if (isSupported) {
            final languageCode = systemLocale.languageCode;
            emit(
              LanguageState(locale: Locale(languageCode)),
            );
            AppConfig.appLang = languageCode;

            DebugIT.printLog(_tag,
                'set the app language device locale $systemLocale since the storedLanguage is $storedLanguage');
          } else {
            emit(
              const LanguageState(locale: Locale('ar')),
            );
            AppConfig.appLang = 'ar';

            DebugIT.printLog(_tag,
                'system locale $systemLocale is not supported, defaulting to Arabic');
          }
        }
      },
    );
  }
}
