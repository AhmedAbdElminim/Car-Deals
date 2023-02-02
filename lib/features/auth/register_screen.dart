import 'package:car_deals/controllers/auth_controller/auth_cubit/rergister_cubit.dart';
import 'package:car_deals/controllers/auth_controller/auth_states/register_states.dart';
import 'package:car_deals/features/auth/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/fade_animation.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../layout/layout_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String registerScreenId = 'RegisterScreenId';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            navigateAndFinish(context, LayOutScreen.layoutScreenId);
            showToAst(msg: 'Register Done Successfully', isError: false);
          }
          if (state is RegisterErrorState) {
            showToAst(msg: state.error, isError: true);
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            image:
                                AssetImage('assets/images/auth/app_logo.png'),
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      FadeAnimation(
                        .5,
                        child: Text(
                          '${getLang(context, 'register_Screen_register')}',
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
                          '${getLang(context, 'register_Screen_name')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        1,
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return '${getLang(context, 'text_form_validate_name')}';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            hintText:
                                '${getLang(context, 'register_Screen_name_hint')}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        1.25,
                        child: Text(
                          '${getLang(context, 'register_Screen_phone')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        1.5,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return '${getLang(context, 'text_form_validate_phone')}';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone_android,
                              color: Colors.black,
                            ),
                            hintText:
                                '${getLang(context, 'register_Screen_phone_hint')}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        1.75,
                        child: Text(
                          '${getLang(context, 'register_Screen_email')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        2,
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
                        2.25,
                        child: Text(
                          '${getLang(context, 'register_Screen_password')}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      FadeAnimation(
                        2.5,
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
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        3,
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              cubit.registerNewUser(
                                  userName: nameController.text,
                                  password: passController.text,
                                  userImage: '',
                                  userPhone: phoneController.text,
                                  emailAddress: emailController.text);
                            }
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: defaultColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: state is RegisterLoadingState
                                    ? const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        '${getLang(context, 'register_Screen_register')}',
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
                        3.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${getLang(context, 'register_Screen_already_have_an_account')}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateAndFinish(
                                      context, LoginScreen.loginScreenId);
                                },
                                child: Text(
                                  '${getLang(context, 'register_Screen_register_now')}',
                                  style: TextStyle(color: defaultColor),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        3.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              color: Colors.grey[700],
                            )),
                            Text(
                              '${getLang(context, 'register_Screen_or')}',
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
                      // FadeAnimation(3.75,
                      //     child: Center(
                      //       child: Text(
                      //         '${getLang(context, 'register_Screen_login_with_social_networks')}',
                      //         style: const TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     )),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${getLang(context, 'register_Screen_register_with_phone_number')}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  defaultNavigate(
                                      context, PhoneScreen.phoneScreenId);
                                },
                                child: Text(
                                  '${getLang(context, 'register_Screen_phone_button_register')}',
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
