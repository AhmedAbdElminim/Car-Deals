abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetUserDataLoadingState extends HomeStates {}

class HomeGetUserDataSuccessState extends HomeStates {}

class HomeGetUserDataErrorState extends HomeStates {
  final String error;
  HomeGetUserDataErrorState({required this.error});
}
