import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:car_deals/models/car_model.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../shared/component/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<CarModel> carsList = [];
  List<CarModel> onGoingCarsList = [];
  List<CarModel> finishedCarsList = [];
  String categoriesType = 'All';
  Map<String, String> getLangMap = {
    "All": "home_popup_menu_all",
    "OnGoing": "home_popup_menu_ongoing",
    "Finished": "home_popup_menu_finished",
  };
  Future<void> getUserData() async {
    try {
      emit(HomeGetUserDataLoadingState());
      if (await execute(customInstance)) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .get()
            .then((documentSnapshot) {
          if (documentSnapshot.exists) {
            userModel = UserModel.fromJson(documentSnapshot.data()!);
          }
          _getCars().then((value) {
            emit(HomeGetUserDataSuccessState());
          });
        });
      } else {
        emit(HomeGetUserDataInternetConnectionErrorState());
      }
    } catch (error) {
      emit(HomeGetUserDataErrorState(error: error.toString()));
    }
  }

  Future<void> _getCars() async {
    try {
      // emit(HomeGetCarsLoadingState());
      //print('hello world');
      FirebaseFirestore.instance.collection('cars').get().then((value) {
        value.docs.forEach((value) {
          carsList.add(CarModel.fromJson(value.data()));
          if ((7 -
                  (DateTime.now()
                      .difference(
                          DateTime.parse(value.data()['carPublishedDate']))
                      .inDays)) >
              0) {
            onGoingCarsList.add(CarModel.fromJson(value.data()));
          } else {
            finishedCarsList.add(CarModel.fromJson(value.data()));
          }
        });
        // _getUserData(userId: uId);

        emit(HomeGetCarsSuccessState());
      });
    } catch (error) {
      emit(HomeGetCarsErrorState(error: error.toString()));
    }
  }

  bool getExpired({required String date}) {
    //"2023-01-28"

    return DateTime.now().difference(DateTime.parse(date)).inDays >= 7;
  }

  void changeCategories({required String categoriesTypeString}) {
    categoriesType = categoriesTypeString;
    emit(ChangeCategoriesTypeState());
  }
}
