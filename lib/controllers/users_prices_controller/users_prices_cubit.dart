import 'package:car_deals/controllers/users_prices_controller/users_prices_states.dart';
import 'package:car_deals/models/price_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/constants.dart';

class UsersPricesCubit extends Cubit<UsersPricesStates> {
  UsersPricesCubit() : super(UsersPricesInitialState());
  static UsersPricesCubit get(context) => BlocProvider.of(context);
  List<PriceModel> pricesList = [];

  Future<void> getPricesList({required String carId}) async {
    try {
      emit(GetPricesLoadingState());
      FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('prices')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          pricesList.add(PriceModel.fromJson(element.data()!));
        });
        emit(GetPricesSuccessState());
      });
    } catch (error) {
      emit(GetPricesErrorState(error: error.toString()));
    }
  }

  Future<void> putPrice({required int userPrice, required String carId}) async {
    try {
      emit(PutPricesLoadingState());
      PriceModel priceModel = PriceModel(
          userId: uId,
          userName: userModel.userName,
          userPhone: userModel.userPhone,
          userPrice: userPrice);
      FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('prices')
          .doc()
          .set(priceModel.toJson())
          .then((value) {
        emit(PutPricesSuccessState());
      });
    } catch (error) {
      emit(PutPricesErrorState(error: error.toString()));
    }
  }
}
