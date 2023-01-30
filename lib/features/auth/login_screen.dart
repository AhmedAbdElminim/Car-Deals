import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/register_screen.dart';
import 'package:car_deals/features/auth/fade_animation.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:car_deals/shared/style/colors.dart';

import '../../shared/component/widgets.dart';
import '../layout/layout_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const loginScreenId = 'LoginScreenId';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeAnimation(
                .25,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/auth/app_logo.png'),
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
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '${getLang(context, 'login_Screen_reset_password')}',
                        style: TextStyle(
                            color: defaultColor, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              FadeAnimation(
                2,
                child: InkWell(
                  onTap: () {
                    navigateAndFinish(context, LayOutScreen.layoutScreenId);
                  },
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: defaultColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
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
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateAndFinish(
                              context, RegisterScreen.registerScreenId);
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
              const SizedBox(
                height: 10,
              ),
              FadeAnimation(2.75,
                  child: Center(
                    child: Text(
                      '${getLang(context, 'login_Screen_login_with_social_networks')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: const Image(
                        image: AssetImage(
                          'assets/images/auth/facebook logo.png',
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: const Image(
                        image: AssetImage('assets/images/auth/google logo.png'),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
