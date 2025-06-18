import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/home/cubit/home_cubit.dart';
import 'package:marrige_app/layouts/home/home_view.dart';
import 'package:marrige_app/layouts/my_account/my_account_screen.dart';
import 'package:marrige_app/layouts/rate/rate_us_screen.dart';
import 'package:marrige_app/layouts/report_user/report_user.dart';

import 'package:marrige_app/layouts/start/splash_screen.dart';
import 'package:marrige_app/layouts/verfiy_email/verify_eamil_screen.dart';
import 'package:marrige_app/libs/dialogs/custom_dialog.dart';
import 'config/config.dart';
import 'layouts/addtional_ways_to_contact/addtional_ways_to_contact_screen.dart';
import 'layouts/choose_avatar/choose_avatar_screen.dart';
import 'layouts/confirm_mobile/confirm_mobile_screen.dart';
import 'layouts/email_support/email_support.dart';
import 'layouts/help/main_help_screen.dart';
import 'layouts/home_widgets_other_screen/home_widgets_other_screen.dart';
import 'layouts/messages_all/messages_all_screen.dart';
import 'layouts/my_photo_screen/my_photo_screen.dart';
import 'layouts/my_photo_screen/my_photos_screen.dart';
import 'layouts/notification/notification.dart';
import 'layouts/notification/notification_management.dart';
import 'layouts/profile_first/profile_first_screen.dart';
import 'layouts/search/search_view.dart';
import 'layouts/send_email/send_email_screen.dart';
import 'layouts/special_offer/special_offer_screen.dart';
import 'layouts/spotlight_active/spotlight_active_screen.dart';
import 'layouts/upgrade/upgrade_one_screen.dart';
import 'libs/connectivity/internet_connection_helper.dart';
import 'libs/dataproviders/local/local.dart';
import 'libs/lang/lang.dart';
import 'libs/lifecycle/app_lifecycle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyValueStorage = KeyValueStorage();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final LanguageBloc languageBloc = LanguageBloc(keyValueStorage);
  languageBloc.add(LoadLanguage());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
              BlocProvider<LanguageBloc>(create: (_) => languageBloc),
              BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
            ],
            child: AppLifecycleManager(
              internetConnectionHelper: InternetConnectionHelper(),
              child: const MyApp(),
            ),
          ),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    Future.delayed(Duration(seconds: 1), () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (_, languageState) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.dark,
                  navigatorKey: navigatorKey,
                  darkTheme: AppTheme.dark(
                    languageState.locale.languageCode,
                    context,
                  ),
                  theme: AppTheme.light(
                    languageState.locale.languageCode,
                    context,
                  ),
                  locale: languageState.locale,
                  supportedLocales:
                      AppConfig.supportedLocales
                          .map((lang) => lang['locale'] as Locale)
                          .toList(),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: child,
                );
              },
              child: UpgradeOneScreen(),
            );
          },
        );
      },
    );
  }
}

///VerifyEmailScreen=>Cubit
///SpotlightActiveScreen
///SpecialOfferScreen => Cubit
///EmailSupport =>Cubit
///SearchView** =>Not Req Cubit
///ReportUser =>Cubit
///RateUsScreen=>Cubit
///ProfileFirstScreen =>Cubit
///UpgradeOneScreen => Cubit
///NotificationScreen => Cubit
///NotificationManagement =>>Not Req Cubit
///MyPhotoScreen=>Not Req Cubit
///MyPhotosScreen=>Cubit
///MyAccountScreen=>Cubit
///MessagesAllScreen=> Cubit
///HomeWidgetsOtherScreen >Not Req Because Use In Home View
///HomeView =>Cubit
///MainHelpScreen => Not Req Cubit
///ConfirmMobileScreen=>Cubit
///ChooseAvatarScreen=>Cubit
///AddtionalWaysToContactScreen=>Cubit
