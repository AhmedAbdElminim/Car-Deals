abstract class CarDetailStates {}

class CarDetailInitialState extends CarDetailStates {}

class GetCarDetailLoadingState extends CarDetailStates {}

class GetCarDetailSuccessState extends CarDetailStates {}

class GetCarDetailErrorState extends CarDetailStates {
  final String error;
  GetCarDetailErrorState({required this.error});
}
class GetCarDetailInternetConnectionErrorState extends CarDetailStates{}
