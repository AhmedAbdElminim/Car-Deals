import 'package:flutter/material.dart';

import 'brands_logoes_path.dart';
import 'category_card_item_widget.dart';

class HatchBackScreen extends StatelessWidget {
  const HatchBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
          brandLogoPaths.length,
          (index) => CategoryCardItemWidget(
                logoPath: brandLogoPaths[index],
                carBrand: brandsName[index],
                carType: 'Hatchback',
              )),
    );
  }
}
