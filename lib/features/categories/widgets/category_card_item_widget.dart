import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';

import '../brand_cars_screen.dart';

class CategoryCardItemWidget extends StatelessWidget {
  const CategoryCardItemWidget({Key? key, required this.logoPath})
      : super(key: key);
  final String logoPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        defaultNavigate(context: context, screenName:BrandCarsScreen.brandCarsScreenId);
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
