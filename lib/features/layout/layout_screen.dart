import 'package:flutter/material.dart';
import 'package:car_deals/features/categories/categories_screen.dart';
import 'package:car_deals/features/notification/notification_screen.dart';
import 'package:car_deals/features/home/home_screen.dart';
import 'package:car_deals/features/user/user_screen.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';

import 'package:unicons/unicons.dart';

import '../apply/apply_screen.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({Key? key}) : super(key: key);
  static const String layoutScreenId = 'LayOutScreenId';

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  int currentIndex=0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const NotificationScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          defaultNavigate(
              context: context, screenName: ApplyScreen.applyScreenId);
        },
        backgroundColor: defaultColor,
        child: const Icon(UniconsLine.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                UniconsLine.home,
                color: currentIndex == 0 ? defaultColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                UniconsLine.car,
                color: currentIndex == 1 ? defaultColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: currentIndex == 2 ? defaultColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                UniconsLine.user,
                color: currentIndex == 3 ? defaultColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
