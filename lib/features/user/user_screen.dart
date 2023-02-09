import 'package:car_deals/features/auth/login_screen.dart';
import 'package:car_deals/features/no_internet/no_internet_screen.dart';
import 'package:car_deals/features/user/screens/history_screen.dart';
import 'package:car_deals/features/user/screens/update_user_information_screen.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../shared/component/app_local.dart';
import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../auth/fade_animation.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isLoading = (userModel == null);
  bool isInternetConnected = true;
  @override
  void initState() {
    if (isLoading) {
      getUserData();
    }

    super.initState();
  }

  Future<void> getUserData() async {
    try {
      if (await execute(customInstance)) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .get()
            .then((documentSnapshot) {
          if (documentSnapshot.exists) {
            userModel = UserModel.fromJson(documentSnapshot.data()!);
          }
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        setState(() {
          isInternetConnected = false;
        });
        showInternetConnectionDialog(context: context);
      }
    } catch (error) {
      showMyDialog(context: context, msg: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // if(!isInternetConnection){
    //   showInternetConnectionDialog(context: context);
    // }
    return Scaffold(
      body: isLoading
          ? const Center(child: LoadingWidget(loadingNum: 1))
          : !isInternetConnected
              ? const NoInternetScreen()
              : Stack(
                  children: [
                    Container(
                      height: screenHeight * .25,
                      width: screenWidth,
                      color: defaultColor,
                    ),
                    FadeAnimation(
                      .25,
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * .06),
                          child: Text(
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
                        top: screenHeight * .13,
                        left: 20,
                        right: 20,
                        child: FadeAnimation(
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
                                child: Stack(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundColor: defaultColor,
                                            backgroundImage: const AssetImage(
                                                'assets/images/app_icons/user_icon.png'),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            userModel!.userName,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '@${userModel!.userName}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FadeAnimation(
                                      .75,
                                      child: IconButton(
                                        onPressed: () {
                                          defaultNavigate(
                                                  context: context,
                                                  screenName:
                                                      UpdateUserInformationScreen
                                                          .updateUserInformationScreenId)
                                              .then((value) {
                                            setState(() {});
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: defaultColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * .4),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
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
                              title:
                                  Text('${getLang(context, "profile_email")}'),
                              subtitle: Text(userModel!.userEmail),
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
                              title:
                                  Text('${getLang(context, "profile_phone")}'),
                              subtitle: Text(userModel!.userPhone),
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
                              title: Text(
                                  '${getLang(context, "profile_history")}'),
                              subtitle: Text(
                                  '${getLang(context, 'profile_history_description')}'),
                              onTap: () {
                                defaultNavigate(
                                    context: context,
                                    screenName: HistoryScreen.historyScreenId);
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
                                  Icons.info,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text(
                                  '${getLang(context, "profile_about_app")}'),
                              onTap: () {},
                            ),
                          ),
                          FadeAnimation(
                            2.0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: defaultColor,
                                child: const Center(
                                    child: Icon(
                                  Icons.rate_review,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text(
                                  '${getLang(context, "profile_rate_app")}'),
                              onTap: () {},
                            ),
                          ),
                          FadeAnimation(
                            2.25,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: defaultColor,
                                child: const Center(
                                    child: Icon(
                                  Icons.contact_emergency,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text(
                                  '${getLang(context, "profile_contact_with_us")}'),
                              onTap: () {},
                            ),
                          ),
                          FadeAnimation(
                            2.5,
                            child: ListTile(
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          '${getLang(context, 'logout_dialog_title')}'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            // Text('This is a demo alert dialog.'),
                                            // Text('Would you like to approve of this message?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            '${getLang(context, 'Logout_dialog_cancel_button')}',
                                            style:
                                                TextStyle(color: defaultColor),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            '${getLang(context, 'logout_dialog_approve_button')}',
                                            style:
                                                TextStyle(color: defaultColor),
                                          ),
                                          onPressed: () async {
                                            await FirebaseAuth.instance
                                                .signOut()
                                                .then((value) {
                                              CacheHelper.removeData(
                                                  key: 'uId');
                                              navigateAndFinish(
                                                  context: context,
                                                  screenName: LoginScreen
                                                      .loginScreenId);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              leading: CircleAvatar(
                                backgroundColor: defaultColor,
                                child: const Center(
                                    child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                )),
                              ),
                              title:
                                  Text('${getLang(context, "profile_logout")}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
