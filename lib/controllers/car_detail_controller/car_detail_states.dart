abstract class CarDetailStates {}

class CarDetailInitialState extends CarDetailStates {}

class GetCarDetailLoadingState extends CarDetailStates {}

class GetCarDetailSuccessState extends CarDetailStates {}

class GetCarDetailErrorState extends CarDetailStates {
  final String error;
  GetCarDetailErrorState({required this.error});
}
class GetCarDetailInternetConnectionErrorState extends CarDetailStates{}
class CheckTransactionStatusSuccessState extends CarDetailStates {}
class CheckTransactionStatusLoadingState extends CarDetailStates {}
class ShowDialogState extends CarDetailStates {}
class PayMobAuthSuccessState extends CarDetailStates {}
class TransactionSuccessState extends CarDetailStates {}
class PayLoadingState extends CarDetailInitialState{}





