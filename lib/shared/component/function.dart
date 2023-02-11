import 'dart:async';

import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> navigateAndFinish(
        {required BuildContext context,
        required String screenName,
        Object? args}) =>
    Navigator.pushNamedAndRemoveUntil(
        context, screenName, arguments: args, (route) => false);
Future<void> defaultNavigate(
        {required BuildContext context,
        required String screenName,
        Object? args}) =>
    Navigator.pushNamed(context, screenName, arguments: args);

Future<void> showToAst({required String msg, required bool isError}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<void> showMyDialog(
    {required BuildContext context, required String msg}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${getLang(context, 'error_message_title')}'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('${getLang(context, 'error_message_body')}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('${getLang(context, 'error_message_button')}'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showInternetConnectionDialog(
    {required BuildContext context, Function? function}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${getLang(context, 'error_message_title')}'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Image(
                image: AssetImage(
                    'assets/images/app_icons/no_internet_connection.png'),
                height: 60,
                width: 60,
              ),
              const SizedBox(
                height: 5,
              ),
              Text('${getLang(context, 'internet_connection_message')}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              '${getLang(context, 'error_message_button')}',
              style: TextStyle(color: defaultColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

final InternetConnectionChecker customInstance =
    InternetConnectionChecker.createInstance(
  checkTimeout: const Duration(seconds: 1),
  checkInterval: const Duration(seconds: 1),
);
Future<bool> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  bool isConnected = await InternetConnectionChecker().hasConnection;
  if (!isConnected) {
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnected = true;
            break;
          case InternetConnectionStatus.disconnected:
            isConnected = false;
            break;
        }
      },
    );

    await Future<void>.delayed(const Duration(seconds: 5));
    await listener.cancel();
    return isConnected;
  }

  return isConnected;
}

// if(await execute(InternetConnectionChecker())){}else{}
Future<void> loadingDialog({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        //title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Center(child: Padding(
                padding: EdgeInsets.all(8.0),
                child: LoadingWidget(loadingNum: 1),
              ),)
            ],
          ),
        ),

      );
    },
  );
}