import 'package:car_deals/features/user/screens/history_screen.dart';
import 'package:car_deals/features/user/screens/update_user_information_screen.dart';
import 'package:flutter/material.dart';


import '../../shared/component/app_local.dart';
import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../auth/fade_animation.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
        ),
        Container(
          height: screenHeight * .3,
          width: screenWidth,
          color: defaultColor,
        ),
        FadeAnimation(
          .25,
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * .08),
              child:  Text(
                '${getLang(context, "profile_title")}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
            top: screenHeight * .18,
            left: 20,
            right: 20,
            child: Column(
              children: [
                FadeAnimation(
                  .5,
                  child: SizedBox(
                    height: 200,
                    width: screenWidth,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: defaultColor,
                              backgroundImage: const AssetImage(
                                  'assets/images/onboarding/onbaordingcar1.jpeg'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Mercedes Benz',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '@mercedesbenz',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: defaultColor,
                      child: const Center(
                          child: Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                    ),
                    title:  Text('${getLang(context, "profile_email")}'),
                    subtitle: const Text('mercdesbenz@mercedes.com'),
                  ),
                ),
                FadeAnimation(
                  1.25,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: defaultColor,
                      child: const Center(
                          child: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      )),
                    ),
                    title:  Text('${getLang(context, "profile_phone")}'),
                    subtitle: const Text('01095295641'),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: defaultColor,
                      child: const Center(
                          child: Icon(
                        Icons.history,
                        color: Colors.white,
                      )),
                    ),
                    title:  Text('${getLang(context, "profile_history")}'),
                    subtitle:  Text('${getLang(context, 'profile_history_description')}'),
                    onTap: () {
                      defaultNavigate(context, HistoryScreen.historyScreenId);
                    },
                  ),
                ),
                FadeAnimation(
                  1.75,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: defaultColor,
                      child: const Center(
                          child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      )),
                    ),
                    title:  Text('${getLang(context, "profile_logout")}'),
                  ),
                ),
              ],
            )),
        Positioned(
            right: 35,
            top: screenHeight * .19,
            child: FadeAnimation(
              .75,
              child: IconButton(
                onPressed: () {
                  defaultNavigate(
                      context,
                      UpdateUserInformationScreen
                          .updateUserInformationScreenId);
                },
                icon: Icon(
                  Icons.edit,
                  color: defaultColor,
                ),
              ),
            )),
      ],
    );
  }
}
