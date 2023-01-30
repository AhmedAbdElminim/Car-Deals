import 'package:flutter/material.dart';
import 'package:car_deals/features/categories/widgets/coupe_screen.dart';
import 'package:car_deals/features/categories/widgets/hatchback_screen.dart';
import 'package:car_deals/features/categories/widgets/sedan_screen.dart';
import 'package:car_deals/features/categories/widgets/suv_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          title: Text(
            '${getLang(context, 'categories_appbar_title')}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Image(
                    image: AssetImage('assets/images/app_icons/sedan.png')),
              ),
              Tab(
                icon: Image(
                    image: AssetImage('assets/images/app_icons/hatchback.png')),
              ),
              Tab(
                icon:
                    Image(image: AssetImage('assets/images/app_icons/suv.png')),
              ),
              Tab(
                icon: Image(
                    image: AssetImage('assets/images/app_icons/coupe.png')),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            SedanScreen(),
            HatchBackScreen(),
            SuvScreen(),
            CoupeScreen(),
          ],
        ),
      ),
    );
  }
}
