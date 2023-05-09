import 'package:car_deals/controllers/user_controller/user_cubit.dart';
import 'package:car_deals/controllers/user_controller/user_states.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  static String contactUsScreenId = "ContactUsScreenId";
  final TextEditingController messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {
          if (state is ContactSuccessState) {
            showToAst(
                msg: '${getLang(context, 'contact_successful_message')}',
                isError: false);
            Navigator.pop(context);
          }
          if (state is InternetConnectionErrorState) {
            showInternetConnectionDialog(context: context);
          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('${getLang(context, 'contact_with_us')}'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: null,
                    title: Text(
                      '${getLang(context, 'contact_question')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '${getLang(context, 'contact_question_description')}'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "${getLang(context, 'empty_message')}";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        hintText: '${getLang(context, 'contact_hint_text')}',
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (state is! ContactLoadingState)
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.contact(msg: messageController.text);
                          }
                        },
                        color: defaultColor,
                        child: Text(
                          '${getLang(context, 'contact_button')}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (state is ContactLoadingState)
                    const Center(
                      child: LoadingWidget(),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
