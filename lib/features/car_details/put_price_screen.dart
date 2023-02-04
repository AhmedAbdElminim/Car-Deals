import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';

import 'components/car_prices_argument.dart';
import 'components/comment_item_component.dart';

class PutPriceScreen extends StatelessWidget {
  const PutPriceScreen({Key? key}) : super(key: key);
  static const String putPriceScreenId = 'PutPriceScreenId';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CarPricesArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.carName),
      ),
      body: Column(
        children: [
          Image(
            image: NetworkImage(args.carImage),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Flexible(
              child: Padding(
            padding: args.carExpired
                ? const EdgeInsets.only(left: 20, right: 20)
                : const EdgeInsets.only(left: 20, right: 20, bottom: 80),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children:
                  List.generate(10, (index) => const CommentItemComponent()),
            ),
          )),
        ],
      ),
      bottomSheet: args.carExpired
          ? null
          : Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${getLang(context, 'enter_your_price')}'),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: defaultColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 21),
                        child: Text(
                          '${getLang(context, 'submit')}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
