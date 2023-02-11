import 'package:car_deals/controllers/user_controller/user_states.dart';
import 'package:car_deals/models/contact_model.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/component/function.dart';
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

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    if (userModel == null) {
      try {
        if (await execute(customInstance)) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get()
              .then((documentSnapshot) {
            if (documentSnapshot.exists) {
              userModel = UserModel.fromJson(documentSnapshot.data()!);
            }
            emit(GetUserDataSuccessState());
          });
        } else {
          emit(InternetConnectionErrorState(error: ''));
        }
      } catch (error) {
        emit(GetUserDataErrorState(error: error.toString()));
      }
    } else {
      emit(GetUserDataSuccessState());
    }
  }

  void refreshScreen() {
    emit(RefreshState());
  }

  Future<void> contact({required String msg}) async {
    emit(ContactLoadingState());
    try {
      if (await execute(customInstance)) {
        ContactModel contactModel = ContactModel(
            userName: userModel!.userName,
            uId: uId,
            userPhone: userModel!.userPhone,
            userMessage: msg);
        FirebaseFirestore.instance
            .collection('contactMessages')
            .doc(uId)
            .set(contactModel.toJson())
            .then((value) {
          emit(ContactSuccessState());
        });
      } else {
        emit(InternetConnectionErrorState(error: ''));
      }
    } catch (error) {
      emit(ContactErrorState(error: error.toString()));
    }
  }
}
