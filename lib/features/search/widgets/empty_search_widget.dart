import 'package:flutter/material.dart';

import '../../../shared/component/app_local.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_icons/empty_search.png',
            height: 170,
            width: 170,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${getLang(context, 'search_empty')}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
