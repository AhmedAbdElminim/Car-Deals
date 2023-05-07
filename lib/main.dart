import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/network/local/cache_helper.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:car_deals/utils/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: defaultColor),
          fontFamily: GoogleFonts.openSans().fontFamily,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: defaultColor, //<-- SEE HERE
          ),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: defaultColor,
                ),
              ),
              prefixIconColor: defaultColor)),
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
      // locale: const Locale("ar", ""),
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
//command for get SHA1,SHA-256   ----> ./gradlew signingReport

// SHA1: 3F:52:C6:DD:90:95:90:40:36:28:DD:73:FB:23:A8:36:58:ED:2B:27
// SHA-256: 2E:B9:5E:12:39:1C:C0:69:C8:61:02:20:AA:B1:EC:25:16:7A:4F:D2:89:5C:0A:11:74:C7:9D:C6:95:76:4B:D4
//release
//SHA1: 7F:20:67:A8:4C:82:79:0D:9B:D1:5D:8A:B6:99:8D:56:CA:E1:C5:B3
//SHA-256: 33:19:A4:E8:9B:8C:D7:C0:22:CB:C8:61:EA:68:E2:51:92:1C:89:36:8A:2B:A8:D1:C0:F0:37:9B:65:83:4F:13
