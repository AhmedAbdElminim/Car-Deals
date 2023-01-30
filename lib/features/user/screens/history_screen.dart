import 'package:car_deals/features/user/screens/widgets/empty_history_screen.dart';
import 'package:flutter/material.dart';


import '../../../shared/component/app_local.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static const String historyScreenId = 'HistoryScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue[900],
        title:  Text('${getLang(context, 'history_appbar_title')}'),
      ),
      body: const EmptyHistory(),
    );
  }
}
