import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);
  static String aboutAppScreenId = "AboutAppScreenId";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Application Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              '${getLang(context, 'about_app_content')}',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: defaultColor,
            child: Text(
              "${getLang(context, 'about_app_button')}",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
