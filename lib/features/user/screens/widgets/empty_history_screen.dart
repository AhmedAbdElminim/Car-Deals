import 'package:flutter/material.dart';

import '../../../../shared/component/app_local.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_icons/history.png',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
             '${getLang(context, 'history_title')}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            '${getLang(context, 'history_description')}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
