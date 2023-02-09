import 'package:car_deals/controllers/user_controller/user_states.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);

  Future<void> updateUserInfo({
    required String userName,
    required String userPhone,
  }) async {
    try {
      emit(UpdateUserInformationLoadingState());
      if (await execute(customInstance)) {
        UserModel userModel1 = UserModel(
            userName: userName,
            uId: uId,
            userEmail: userModel!.userEmail,
            userPhone: userPhone);
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .update(userModel1.toJson())
            .then((value) {
          userModel = userModel1;
          emit(UpdateUserInformationSuccessState());
        });
      } else {
        emit(InternetConnectionErrorState(error: ''));
      }
    } catch (error) {
      emit(UpdateUserInformationErrorState(error: error.toString()));
    }
  }
}
