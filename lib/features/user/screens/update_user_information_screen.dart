import 'package:flutter/material.dart';

import '../../../shared/component/app_local.dart';
import '../../../shared/style/colors.dart';


class UpdateUserInformationScreen extends StatelessWidget {
  const UpdateUserInformationScreen({Key? key}) : super(key: key);
  static const String updateUserInformationScreenId =
      'UpdateUserInformationScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: defaultColor,
        title:  Text('${getLang(context, 'update_uer_data_appbar_title')}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              '${getLang(context, 'update_uer_data_name')}',
              style: const TextStyle(color: Colors.grey),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit), hintText: 'Mercedes Benz'),
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
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: '01095295641'),
            ),
            const SizedBox(
              height: 15,
            ),
             Text(
              '${getLang(context, 'update_uer_data_password')}',
              style: const TextStyle(color: Colors.grey),
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline), hintText: '123456'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                color: defaultColor,
                child:  Text(
                  '${getLang(context, 'update_uer_data_appbar_title')}'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
