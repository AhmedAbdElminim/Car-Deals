abstract class UsersPricesStates {}

class UsersPricesInitialState extends UsersPricesStates {}

class GetPricesLoadingState extends UsersPricesStates {}

class GetPricesSuccessState extends UsersPricesStates {}

class GetPricesErrorState extends UsersPricesStates {
  final String error;
  GetPricesErrorState({required this.error});
}
class PutPricesLoadingState extends UsersPricesStates {}

class PutPricesSuccessState extends UsersPricesStates {}

class PutPricesErrorState extends UsersPricesStates {
  final String error;
  PutPricesErrorState({required this.error});
}
