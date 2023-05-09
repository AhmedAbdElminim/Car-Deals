import 'package:car_deals/controllers/notification_controller/notification_cubit.dart';
import 'package:car_deals/controllers/notification_controller/notification_states.dart';
import 'package:car_deals/features/no_internet/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/notification/widgets/empty_notification.dart';
import 'package:car_deals/features/notification/widgets/full_notification.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/loading_widget.dart';
import '../../shared/component/function.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getNotifications(),
      child: BlocConsumer<NotificationCubit, NotificationStates>(
        listener: (context, state) {
          if (state is GetNotificationErrorState) {
            showMyDialog(context: context, msg: '');
          }
          if (state is GetNotificationInternetConnectionErrorState) {
            showInternetConnectionDialog(context: context).then((value) {
              NotificationCubit.get(context).getNotifications();
            });
          }
        },
        builder: (context, state) {
          var cubit = NotificationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue[900],
              title: Text('${getLang(context, 'notification_appbar_title')}'),
            ),
            body: state is GetNotificationLoadingState
                ? const Center(
                    child: LoadingWidget(),
                  )
                : state is GetNotificationInternetConnectionErrorState
                    ? const NoInternetScreen()
                    : cubit.notificationList.isEmpty
                        ? const EmptyNotification()
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => FullNotification(
                              content: cubit.notificationList[index].content,
                              senderName:
                                  cubit.notificationList[index].senderName,
                              index: index + 1,
                            ),
                            itemCount: cubit.notificationList.length,
                          ),
          );
        },
      ),
    );
  }
}
