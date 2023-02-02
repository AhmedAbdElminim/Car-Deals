import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/network/local/cache_helper.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:car_deals/utils/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/onboarding_screen/onboarding_screen.dart';
import 'features/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  uId = CacheHelper.getData(key: 'uId') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BE3HALY',
      theme: ThemeData(
        //primarySwatch:Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: defaultColor),
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      routes: appRoutes,
      initialRoute:
          SplashScreen.splashScreenId, // OnBoardingScreen.onBoardingScreenId,
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("ar", ""),
      ],
      locale: const Locale("ar", ""),
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      // home: const LoginScreen(),
    );
  }
}
