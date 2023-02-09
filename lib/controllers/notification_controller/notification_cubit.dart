import 'package:car_deals/controllers/notification_controller/notification_states.dart';
import 'package:car_deals/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/constants.dart';
import '../../shared/component/widgets.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(NotificationInitialState());
  static NotificationCubit get(context) => BlocProvider.of(context);
  List<NotificationModel> notificationList = [];
  Future<void> getNotifications() async {
    try {
      emit(GetNotificationLoadingState());
    if(await execute(customInstance)){
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('notifications')
          .get()
          .then((value) {
        value.docs.forEach((value) {
          notificationList.add(NotificationModel.fromJson(value.data()));
        });
        emit(GetNotificationSuccessState());

      });
    }else{ emit(GetNotificationInternetConnectionErrorState()); }
    } catch (error) {
      emit(GetNotificationErrorState(error: error.toString()));

    }
  }
}
