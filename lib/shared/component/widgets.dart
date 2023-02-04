import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
