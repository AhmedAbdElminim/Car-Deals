import 'package:flutter/material.dart';
import 'package:car_deals/features/auth/fade_animation.dart';
import 'package:car_deals/shared/component/app_local.dart';

import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../layout/layout_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String registerScreenId = 'RegisterScreenId';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeAnimation(
                .25,
                child: Image(
                  image: AssetImage('assets/images/auth/app_logo.png'),
                  height: 200,
                  width: 200,
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
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateAndFinish(context, LoginScreen.loginScreenId);
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
              const SizedBox(
                height: 10,
              ),
              FadeAnimation(3.75,
                  child: Center(
                    child: Text(
                      '${getLang(context, 'register_Screen_login_with_social_networks')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                4,
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
