

import 'package:car_deals/features/auth/phone_form.dart';
import 'package:flutter/material.dart';

import '../features/auth/login_screen.dart';
import '../features/auth/otp_screen.dart';
import '../features/auth/phone_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/car_details/car_details_screen.dart';
import '../features/car_details/put_price_screen.dart';
import '../features/categories/brand_cars_screen.dart';
import '../features/layout/layout_screen.dart';
import '../features/onboarding_screen/onboarding_screen.dart';
import '../features/search/search_screen.dart';
import '../features/apply/apply_screen.dart';
import '../features/splash_screen/splash_screen.dart';
import '../features/user/screens/history_screen.dart';
import '../features/user/screens/update_user_information_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  OnBoardingScreen.onBoardingScreenId: (context) => const OnBoardingScreen(),
  LoginScreen.loginScreenId: (context) =>  LoginScreen(),
  RegisterScreen.registerScreenId: (context) =>  RegisterScreen(),
  LayOutScreen.layoutScreenId: (context) => const LayOutScreen(),
  ApplyScreen.applyScreenId: (context) => const ApplyScreen(),
  SearchScreen.searchScreenId: (context) =>  SearchScreen(),
  CarDetailScreen.carDetailScreen: (context) => const CarDetailScreen(),
  HistoryScreen.historyScreenId: (context) => const HistoryScreen(),
  UpdateUserInformationScreen.updateUserInformationScreenId: (context) =>
       UpdateUserInformationScreen(),
  BrandCarsScreen.brandCarsScreenId: (context) => const BrandCarsScreen(),
  PutPriceScreen.putPriceScreenId: (context) =>  PutPriceScreen(),
  PhoneScreen.phoneScreenId: (context) => PhoneScreen(),
  OtpScreen.otpScreenId: (context) =>  OtpScreen(),
  SplashScreen.splashScreenId: (context) => const SplashScreen(),
  PhoneForm.phoneFormScreenId:(context)=> PhoneForm(),
};
