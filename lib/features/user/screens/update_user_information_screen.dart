import 'package:car_deals/controllers/user_controller/user_cubit.dart';
import 'package:car_deals/controllers/user_controller/user_states.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/app_local.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/style/colors.dart';

class UpdateUserInformationScreen extends StatelessWidget {
  UpdateUserInformationScreen({Key? key}) : super(key: key);
  static const String updateUserInformationScreenId =
      'UpdateUserInformationScreenId';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {
          if (state is UpdateUserInformationSuccessState) {
            Navigator.of(context).pop(true);
          }
          if (state is UpdateUserInformationErrorState) {
            showMyDialog(context: context, msg: 'msg');
          }
          if (state is InternetConnectionErrorState) {
            showInternetConnectionDialog(
              context: context,
            );
          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          nameController.text = userModel!.userName;
          phoneController.text = userModel!.userPhone;
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: defaultColor,
              title:
                  Text('${getLang(context, 'update_uer_data_appbar_title')}'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getLang(context, 'update_uer_data_name')}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "${getLang(context, 'text_form_validate_name')}";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.edit),
                          hintText: userModel!.userName),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${getLang(context, 'update_uer_data_phone')}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "${getLang(context, 'text_form_validate_phone')}";
                        }
                        if (value.length != 11) {
                          return "${getLang(context, 'text_form_correct_phone_number')}";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android),
                          hintText: userModel!.userPhone),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: state is UpdateUserInformationLoadingState
                          ? const LoadingWidget(loadingNum: 1)
                          : MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit
                                      .updateUserInfo(
                                          userName: nameController.text,
                                          userPhone: phoneController.text)
                                      .then((value) {});
                                }
                              },
                              color: defaultColor,
                              child: Text(
                                '${getLang(context, 'update_uer_data_appbar_title')}'
                                    .toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    )
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
