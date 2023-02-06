import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_cubit.dart';
import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:car_deals/features/auth/widgets/otp_screen_argument.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/widgets/keyboard_button_component.dart';
import 'package:car_deals/features/auth/widgets/otp_input_component.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:telephony/telephony.dart';

import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../layout/layout_screen.dart';

class OtpScreen extends StatelessWidget {
  static const String otpScreenId = 'OtpScreenId';
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)!.settings.arguments as OtpScreenArgument;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.white),
      ),
    );
    return BlocProvider(
      create: (context) => PhoneAuthCubit()
        ..listenToNewMessage(pinController: pinController)
        ..phoneAuth(phoneNumber: args.phoneNumber),
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PhoneAuthCubit.get(context);
          return Scaffold(
            backgroundColor: defaultColor,
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: screenHeight * .13,
                ),
                Text(
                  '${getLang(context, 'otp_screen_verification')}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  '${getLang(context, 'otp_screen_we_send_otp')}',
                  style: const TextStyle(color: Colors.white),
                ),
                const Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '+201095295641',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                const SizedBox(
                  height: 30,
                ),
                // Implement 6 input fields
                Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Pinput(
                      controller: pinController,
                      //focusNode: focusNode,
                      length: 6,
                      // androidSmsAutofillMethod:
                      //     AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      validator: (value) {
                        return value == '2222' ? null : 'Pin is incorrect';
                      },

                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.amber),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.lightGreenAccent),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                // Display the entered OTP code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${getLang(context, 'otp_screen_didnt_receive')}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            '${getLang(context, 'otp_screen_resend_otp')}',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {},
                  color: Colors.white,
                  child: Text('Test'),
                ),
                const Spacer(),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Directionality(
                //     textDirection: TextDirection.ltr,
                //     child: GridView(
                //       shrinkWrap: true,
                //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         childAspectRatio: 2.2,
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing: 10,
                //       ),
                //       children: [
                //         KeyBoardButton(
                //           buttonTitle: "1",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '1';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '1';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '1';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '1';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '1';
                //               } else {
                //                 _fieldSix.text = '1';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "2",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '2';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '2';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '2';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '2';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '2';
                //               } else {
                //                 _fieldSix.text = '2';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "3",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '3';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '3';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '3';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '3';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '3';
                //               } else {
                //                 _fieldSix.text = '3';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "4",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '4';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '4';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '4';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '4';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '4';
                //               } else {
                //                 _fieldSix.text = '4';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "5",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '5';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '5';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '5';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '5';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '5';
                //               } else {
                //                 _fieldSix.text = '5';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "6",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '6';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '6';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '6';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '6';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '6';
                //               } else {
                //                 _fieldSix.text = '6';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: '7',
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '7';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '7';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '7';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '7';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '7';
                //               } else {
                //                 _fieldSix.text = '7';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "8",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '8';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '8';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '8';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '8';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '8';
                //               } else {
                //                 _fieldSix.text = '8';
                //               }
                //             });
                //           },
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "9",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '9';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '9';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '9';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '9';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '9';
                //               } else {
                //                 _fieldSix.text = '9';
                //               }
                //             });
                //           },
                //         ),
                //         CircleAvatar(
                //           radius: 25,
                //           backgroundColor: Colors.white,
                //           child: GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 if (_fieldSix.text.length == 1) {
                //                   _fieldSix.text = '';
                //                 } else if (_fieldFive.text.length == 1) {
                //                   _fieldFive.text = '';
                //                 } else if (_fieldFour.text.length == 1) {
                //                   _fieldFour.text = '';
                //                 } else if (_fieldThree.text.length == 1) {
                //                   _fieldThree.text = '';
                //                 } else if (_fieldTwo.text.length == 1) {
                //                   _fieldTwo.text = '';
                //                 } else {
                //                   _fieldOne.text = '';
                //                 }
                //               });
                //             },
                //             child: const Icon(
                //               Icons.remove,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //         KeyBoardButton(
                //           buttonTitle: "0",
                //           onTap: () {
                //             setState(() {
                //               if (_fieldOne.text.length != 1) {
                //                 _fieldOne.text = '0';
                //               } else if (_fieldTwo.text.length != 1) {
                //                 _fieldTwo.text = '0';
                //               } else if (_fieldThree.text.length != 1) {
                //                 _fieldThree.text = '0';
                //               } else if (_fieldFour.text.length != 1) {
                //                 _fieldFour.text = '0';
                //               } else if (_fieldFive.text.length != 1) {
                //                 _fieldFive.text = '0';
                //               } else {
                //                 _fieldSix.text = '0';
                //               }
                //             });
                //           },
                //         ),
                //         CircleAvatar(
                //           radius: 25,
                //           backgroundColor: Colors.white,
                //           child: GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 _otp = _fieldOne.text +
                //                     _fieldTwo.text +
                //                     _fieldThree.text +
                //                     _fieldFour.text +
                //                     _fieldFive.text +
                //                     _fieldSix.text;
                //                 if (_otp == '123456') {
                //                   navigateAndFinish(
                //                       context: context,
                //                       screenName: LayOutScreen.layoutScreenId);
                //                 }
                //               });
                //             },
                //             child: Icon(
                //               Icons.done,
                //               color: defaultColor,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
