import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> navigateAndFinish(BuildContext context, String screenName) =>
    Navigator.pushNamedAndRemoveUntil(context, screenName, (route) => false);
Future<void> defaultNavigate(BuildContext context, String screenName) =>
    Navigator.pushNamed(context, screenName);
Future<void> showToAst({required String msg, required bool isError}) {
  return  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

