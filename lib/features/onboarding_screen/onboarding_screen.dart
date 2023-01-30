import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/login_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../../shared/component/widgets.dart';
import '../auth/phone_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String onBoardingScreenId = 'OnBoardingScreenId';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingList = [
      OnBoardingModel(
          'assets/images/onboarding/onboarding1.png',
          '${getLang(context, 'onBoarding1_title')}',
          '${getLang(context, 'onBoarding1_description')}'),
      OnBoardingModel(
          'assets/images/onboarding/onboarding2.png',
          '${getLang(context, 'onBoarding2_title')}',
          '${getLang(context, 'onBoarding2_description')}'),
      OnBoardingModel(
          'assets/images/onboarding/onboarding3.png',
          '${getLang(context, 'onBoarding3_title')}',
          '${getLang(context, 'onBoarding3_description')}'),
    ];
    return Scaffold(
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //if(currentIndex != onBoardingList.length - 1)
            Padding(
              padding: const EdgeInsets.only(top:40,left: 20, right: 20, bottom: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(context, LoginScreen.loginScreenId);
                    },
                    child: Text(
                      '${getLang(context, "onBoarding_skip_button")}',

                      style: TextStyle(color: defaultColor),
                    ),
                  ),
                ],
              ),
            ),
          Flexible(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image(
                    image: AssetImage(onBoardingList[index].imagePath),
                    height: 250,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text(
                      onBoardingList[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Text(
                    onBoardingList[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              itemCount: onBoardingList.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
              controller: pageController, // PageController
              count: onBoardingList.length,
              effect: ExpandingDotsEffect(
                  activeDotColor: defaultColor), // your preferred effect
              onDotClicked: (index) {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  if (currentIndex == onBoardingList.length - 1) {
                    ///TODO NAVIGATE TO THE NEXT SCREEN
                    navigateAndFinish(context, LoginScreen.loginScreenId);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                color: defaultColor,
                child: currentIndex == onBoardingList.length - 1
                    ? Text(
                        '${getLang(context, "onBoarding_go_button")}',
                        style: const TextStyle(color: Colors.white),
                      )
                    : Text(
                        '${getLang(context, "onBoarding_next_button")}',
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
