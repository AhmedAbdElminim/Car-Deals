import 'package:flutter/cupertino.dart';

import '../../../shared/component/app_local.dart';

class EmptyPriceWidget extends StatelessWidget {
  const EmptyPriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Image(
            image: AssetImage('assets/images/app_icons/no_comment_icon.png')),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${getLang(context, 'no_prices_until_now')}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
