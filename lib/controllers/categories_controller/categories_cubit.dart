import 'package:car_deals/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialStates());
  static CategoriesCubit get(context) => BlocProvider.of(context);
  List<CarModel> carList = [];
  Future<void> getCategories({
    required String carBrand,
    required String carType,
  }) async {
    try {
      emit(GetCategoriesLoadingStates());
      FirebaseFirestore.instance
          .collection('cars')
          .where("carBrand", isEqualTo: carBrand)
          .where("carType", isEqualTo: carType)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          carList.add(CarModel.fromJson(element.data()!));
        });
        emit(GetCategoriesSuccessStates());
      });
    } catch (error) {
      emit(GetCategoriesErrorStates(error: error.toString()));
    }
  }
}
