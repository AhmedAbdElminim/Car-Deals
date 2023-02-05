import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:car_deals/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../shared/component/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<CarModel> carsList = [];
  Future<void> _getUserData({required String userId}) async {
    try {
      //emit(HomeGetUserDataLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('Document exists on the database');
          userModel = UserModel.fromJson(documentSnapshot.data()!);
          // emit(HomeGetUserDataSuccessState());
        }
      });
    } catch (error) {
      emit(HomeGetUserDataErrorState(error: error.toString()));
    }
  }

  Future<void> getCars() async {
    try {
      emit(HomeGetCarsLoadingState());
      //print('hello world');
      FirebaseFirestore.instance.collection('cars').get().then((value) {
        value.docs.forEach((value) {
          carsList.add(CarModel.fromJson(value.data()));
        });
        // print('the length of car lis is: ${carsList.length}');
        _getUserData(userId: uId);

        emit(HomeGetCarsSuccessState());
      });
    } catch (error) {
      emit(HomeGetCarsErrorState(error: error.toString()));
    }
  }
}
