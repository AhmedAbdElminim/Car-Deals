import 'package:car_deals/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_detail_states.dart';

class CarDetailCubit extends Cubit<CarDetailStates> {
  CarDetailCubit() : super(CarDetailInitialState());
  static CarDetailCubit get(context) => BlocProvider.of(context);
  late CarModel carModel;
  Future<void> getCarDetail({required String carId}) async {
    try {
      emit(GetCarDetailLoadingState());
      FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .get()
          .then((value) {
        carModel = CarModel.fromJson(value.data()!);
        emit(GetCarDetailSuccessState());
      });
    } catch (error) {
      emit(GetCarDetailErrorState(error: error.toString()));
    }
  }

  bool getExpired({required String date}) {
    //"2023-01-28"

    return DateTime.now().difference(DateTime.parse(date)).inDays == 7;
  }
}
