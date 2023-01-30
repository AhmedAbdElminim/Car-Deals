import 'package:flutter/material.dart';

import '../../../shared/component/app_local.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_icons/not_found_search.png',
            height: 170,
            width: 170,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${getLang(context, 'search_no_result_found')}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${getLang(context, 'search_try_anther')}',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
