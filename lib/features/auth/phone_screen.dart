import 'package:car_deals/features/auth/widgets/otp_screen_argument.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/otp_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';

import 'fade_animation.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);
  static const String phoneScreenId = "PhoneScreenId";
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          FadeAnimation(
            .5,
            child: Container(
              height: screenHeight * .5,
              color: defaultColor,
            ),
          ),
          FadeAnimation(
            .75,
            child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Text(
                    '${getLang(context, 'phone_Screen_register')}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )),
          ),
          FadeAnimation(
            1.0,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/images/auth/phonelogo.png'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: screenHeight * .4,
              right: 25,
              left: 25,
              child: FadeAnimation(
                1.25,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, left: 10, right: 10, top: 10),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Please input phone number";
                              if (value.length != 11)
                                return "please enter correct number";
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText:
                                    '${getLang(context, 'phone_screen_enter_your_phone_number')}'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 60),
                        child: Text(
                          '${getLang(context, 'phone_screen_description')}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          FadeAnimation(
            1.5,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * .59),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        defaultNavigate(
                            context: context,
                            screenName: OtpScreen.otpScreenId,
                            args: OtpScreenArgument(
                                phoneNumber: phoneController.text));
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: defaultColor,
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
