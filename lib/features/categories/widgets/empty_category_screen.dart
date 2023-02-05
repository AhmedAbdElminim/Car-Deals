import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter/material.dart';

class EmptyCategoryScreen extends StatelessWidget {
  const EmptyCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
              image: AssetImage(
                  'assets/images/app_icons/empty_category_icon.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${getLang(context, 'empty_category')}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
