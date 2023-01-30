import 'package:flutter/material.dart';
import 'package:car_deals/features/categories/widgets/car_card_widget.dart';

class BrandCarsScreen extends StatelessWidget {
  const BrandCarsScreen({Key? key}) : super(key: key);
  static const String brandCarsScreenId = 'BrandCarsScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue[900],
        title: const Text('LAMBORGHINI'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const CarCardComponent(),
        itemCount: 10,
      ),
    );
  }
}
