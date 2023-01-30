import 'package:flutter/material.dart';

void navigateAndFinish(BuildContext context, String screenName) =>
    Navigator.pushNamedAndRemoveUntil(context, screenName, (route) => false);
void defaultNavigate(BuildContext context, String screenName) =>
    Navigator.pushNamed(context, screenName);
