import 'package:car_deals/controllers/auth_controller/auth_cubit/login_cubit.dart';
import 'package:car_deals/controllers/auth_controller/auth_states/login_states.dart';
import 'package:car_deals/features/auth/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/register_screen.dart';
import 'package:car_deals/features/auth/fade_animation.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/loading_widget.dart';
import '../../shared/component/widgets.dart';
import '../layout/layout_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const loginScreenId = 'LoginScreenId';
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(context: context, screenName:LayOutScreen.layoutScreenId);
            showToAst(msg: 'LoginSuccessfully', isError: false);
          }
          if (state is LoginErrorState) {
            showToAst(msg: state.error, isError: true);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FadeAnimation(
                        .25,
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              'assets/images/auth/app_logo.png',
                            ),
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        .5,
                        child: Text(
                          '${getLang(context, 'login_Screen_login')}',
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        .75,
                        child: Text(
                          '${getLang(context, 'login_Screen_email')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        1,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return '${getLang(context, 'text_form_validate_email')}';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'example@example.com',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.25,
                        child: Text(
                          '${getLang(context, 'login_Screen_password')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        1.5,
                        child: TextFormField(
                          controller: passController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return '${getLang(context, 'text_form_validate_password')}';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            ),
                            hintText: '******',
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${getLang(context, 'login_Screen_forgot_password')}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '${getLang(context, 'login_Screen_reset_password')}',
                                style: TextStyle(
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      FadeAnimation(
                        2,
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              cubit.loginUser(
                                  emailAddress: emailController.text,
                                  password: passController.text);
                            }
                          },
                          child: state is LoginLoadingState
                              ? const LoadingWidget(
                                  loadingNum: 1,
                                )
                              : Container(
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    color: defaultColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Center(
                                      child: Text(
                                        '${getLang(context, 'login_Screen_login')}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      FadeAnimation(
                        2.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${getLang(context, 'login_Screen_dont_have_an_account')}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateAndFinish(
                                      context:context,screenName:RegisterScreen.registerScreenId);
                                },
                                child: Text(
                                  '${getLang(context, 'login_Screen_register_now')}',
                                  style: TextStyle(color: defaultColor),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        2.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              color: Colors.grey[700],
                            )),
                            Text(
                              '${getLang(context, 'login_Screen_or')}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              color: Colors.grey[700],
                            )),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // FadeAnimation(2.75,
                      //     child: Center(
                      //       child: Text(
                      //         '${getLang(context, 'login_Screen_login_with_social_networks')}',
                      //         style: const TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${getLang(context, 'login_Screen_login_with_phone_number')}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  defaultNavigate(
                                      context: context, screenName:PhoneScreen.phoneScreenId);
                                },
                                child: Text(
                                  '${getLang(context, 'login_Screen_phone_button_login')}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColor),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
