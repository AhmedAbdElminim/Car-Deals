import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../shared/component/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> getUserData({required String userId}) async {
    try {
      emit(HomeGetUserDataLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('Document exists on the database');
          userModel = UserModel.fromJson(documentSnapshot.data()!);
          emit(HomeGetUserDataSuccessState());
        }
      });
    } catch (error) {
      emit(HomeGetUserDataErrorState(error: error.toString()));
    }
  }
}
