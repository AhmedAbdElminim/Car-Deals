import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';

import '../brand_cars_screen.dart';
import 'brand_cars_screen_argument.dart';

class CategoryCardItemWidget extends StatelessWidget {
  const CategoryCardItemWidget(
      {Key? key,
      required this.logoPath,
      required this.carBrand,
      required this.carType})
      : super(key: key);
  final String logoPath;
  final String carType;
  final String carBrand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        defaultNavigate(
            context: context,
            screenName: BrandCarsScreen.brandCarsScreenId,
            args: BrandCarsArgument(carBrand: carBrand, carType: carType));
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: defaultColor)),
        child: Center(
          child: Image(
            image: AssetImage(logoPath),
          ),
        ),
      ),
    );
  }
}
