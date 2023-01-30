import 'package:flutter/material.dart';
import 'package:car_deals/features/notification/widgets/empty_notification.dart';
import 'package:car_deals/features/notification/widgets/full_notification.dart';
import 'package:car_deals/shared/component/app_local.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue[900],
        title:  Text('${getLang(context, 'notification_appbar_title')}'),
      ),
      body: true
          ? const EmptyNotification()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const FullNotification(),
              itemCount: 10,
            ),
    );
  }
}
