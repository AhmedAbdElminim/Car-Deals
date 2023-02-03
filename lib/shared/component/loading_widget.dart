import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({required this.loadingNum, Key? key}) : super(key: key);
  final int loadingNum;
  @override
  Widget build(BuildContext context) {
    return loadingNum == 1
        ? SpinKitFadingCube(
            color: defaultColor,
            size: 50.0,
          )
        : SpinKitDoubleBounce(
            color: defaultColor,
            size: 50,
          );
  }
}
