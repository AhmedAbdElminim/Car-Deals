import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_cubit.dart';
import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:car_deals/features/auth/phone_form.dart';
import 'package:car_deals/features/auth/widgets/otp_screen_argument.dart';
import 'package:car_deals/features/auth/widgets/phone_form_screen_argument.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/widgets/keyboard_button_component.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pinput/pinput.dart';
import '../../shared/component/function.dart';
import '../../shared/style/colors.dart';

class OtpScreen extends StatelessWidget {
  static const String otpScreenId = 'OtpScreenId';
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context)!.settings.arguments as OtpScreenArgument;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.white),
      ),
    );
    return BlocProvider(
      create: (context) => PhoneAuthCubit()
        ..phoneAuth(
          phoneNumber: args.phoneNumber,
        ),
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
        listener: (context, state) {
          if (state is CheckPinCodeLoadingStates) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: SpinKitFadingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ));
          }
          if (state is CheckPinCodeSuccessStates) {
            navigateAndFinish(
                context: context,
                screenName: PhoneForm.phoneFormScreenId,
                args: PhoneFormArgument(phoneNum: args.phoneNumber));
          }
          if (state is OtpInternetConnectionErrorStates) {
            showInternetConnectionDialog(context: context);
          }
        },
        builder: (context, state) {
          var cubit = PhoneAuthCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: defaultColor,
            body: state is PhoneAuthLoadingStates
                ? const Center(
                    child: SpinKitFadingCube(
                    color: Colors.white,
                    size: 50.0,
                  ))
                : Column(
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
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            '+2${args.phoneNumber}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Form(
                            key: formKey,
                            child: Pinput(
                              controller: pinController,
                              //focusNode: focusNode,
                              length: 6,
                              keyboardType: TextInputType.none,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: defaultPinTheme,
                              validator: (value) {
                                return value == '${cubit.otpCode}'
                                    ? null
                                    : '${getLang(context, 'otp_validation_message')}';
                              },

                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                if (formKey.currentState!.validate()) {
                                  cubit
                                      .checkPinCode(pinCode: pinController.text)
                                      .then((value) {});
                                }
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                              }, //01008894079
                              onSubmitted: (pin) {},
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
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.amber),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
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
                                  style: const TextStyle(color: Colors.red),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            children: [
                              KeyBoardButton(
                                buttonTitle: "1",
                                onTap: () {
                                  pinController.append('1', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "2",
                                onTap: () {
                                  pinController.append('2', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "3",
                                onTap: () {
                                  pinController.append('3', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "4",
                                onTap: () {
                                  pinController.append('4', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "5",
                                onTap: () {
                                  pinController.append('5', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "6",
                                onTap: () {
                                  pinController.append('6', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: '7',
                                onTap: () {
                                  pinController.append('7', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "8",
                                onTap: () {
                                  pinController.append('8', 6);
                                },
                              ),
                              KeyBoardButton(
                                buttonTitle: "9",
                                onTap: () {
                                  pinController.append('9', 6);
                                },
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: GestureDetector(
                                  onTap: () {
                                    // cubit.trimController(pinController: pinController);
                                    pinController.text = pinController.text
                                        .substring(
                                            0, pinController.text.length - 1);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              KeyBoardButton(
                                buttonTitle: "0",
                                onTap: () {
                                  pinController.append('0', 6);
                                },
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: GestureDetector(
                                  onTap: pinController.text.length != 6
                                      ? null
                                      : () {
                                          cubit
                                              .checkPinCode(
                                                  pinCode: pinController.text)
                                              .then((value) {
                                            // navigateAndFinish(
                                            //     context: context,
                                            //     screenName:
                                            //         PhoneForm.phoneFormScreenId,
                                            //     args: PhoneFormArgument(
                                            //         phoneNum:
                                            //             args.phoneNumber));
                                          });
                                        },
                                  child: Icon(
                                    Icons.done,
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
