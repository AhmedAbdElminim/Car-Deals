import 'package:car_deals/controllers/search_controller/search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/car_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  bool isBrand = true;

  void changeSearchFilter() {
    isBrand = !isBrand;
    emit(SearchLoadingState());
  }

  List<CarModel> foundCars = [];

  // This function is called whenever the text field changes
  void runFilter(
      {required String enteredKeyword,
      required List<CarModel> allCars,
      required TextEditingController keyFilter}) {
    emit(SearchLoadingState());

    List<CarModel> results = [];
    if (enteredKeyword.isEmpty || keyFilter.text.isEmpty) {
      emit(SearchLoadingState());
    } else {
      if (isBrand) {
        results = allCars
            .where((car) => car.carBrand
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        foundCars = results;
        emit(SearchSuccessState());
      } else {
        results = allCars
            .where((car) => car.carName
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        foundCars = results;
        emit(SearchSuccessState());
      }
    }
  }
}
