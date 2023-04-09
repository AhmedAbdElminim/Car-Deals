abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetUserDataLoadingState extends HomeStates {}

class HomeGetUserDataSuccessState extends HomeStates {}

class HomeGetUserDataErrorState extends HomeStates {
  final String error;
  HomeGetUserDataErrorState({required this.error});
}

class HomeGetCarsLoadingState extends HomeStates {}

class HomeGetCarsSuccessState extends HomeStates {}

class HomeGetCarsErrorState extends HomeStates {
  final String error;
  HomeGetCarsErrorState({required this.error});
}
class HomeGetUserDataInternetConnectionErrorState extends HomeStates{}

class ChangeCategoriesTypeState extends HomeStates {}
