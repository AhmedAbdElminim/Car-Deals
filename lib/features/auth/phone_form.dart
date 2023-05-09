import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_cubit.dart';
import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:car_deals/features/auth/widgets/phone_form_screen_argument.dart';
import 'package:car_deals/features/layout/layout_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/component/constants.dart';
import '../../shared/style/colors.dart';

class PhoneForm extends StatelessWidget {
  PhoneForm({Key? key}) : super(key: key);
  static const String phoneFormScreenId = 'PhoneFormScreenId';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PhoneFormArgument;
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
        listener: (context, state) {
          if (state is CreateNewUserSuccessStates) {
            showToAst(
                msg: '${getLang(context, 'successfully_register_message')}',
                isError: false);
            navigateAndFinish(
                context: context,
                screenName: LayOutScreen.layoutScreenId);
          }

          if (state is CreateUserInternetConnectionErrorStates) {
            showInternetConnectionDialog(context: context);
          }
        },
        builder: (context, state) {
          var cubit = PhoneAuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: defaultColor,
                      backgroundImage: const AssetImage(
                          'assets/images/app_icons/user_icon.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${getLang(context, 'register_Screen_name')}'),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '${getLang(context, 'text_form_validate_name')}';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '${getLang(context, 'register_Screen_name')}',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${getLang(context, 'register_Screen_email')}'),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '${getLang(context, 'text_form_validate_email')}';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText:
                            '${getLang(context, 'register_Screen_email')}',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state is! CreateNewUserLoadingStates)
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: defaultColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit
                                  .addNewUser(
                                      userName: nameController.text,
                                      uId: uId,
                                      userPhone: args.phoneNum,
                                      userEmail: emailController.text)
                                  .then((value) {

                              });
                            }
                          },
                          child: Text(
                            '${getLang(context, 'submit_button')}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    if (state is CreateNewUserLoadingStates)
                      const LoadingWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
