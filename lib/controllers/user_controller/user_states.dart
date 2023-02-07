abstract class UserStates {}

class UserInitialState extends UserStates {}

class UpdateUserInformationLoadingState extends UserStates {}

class UpdateUserInformationSuccessState extends UserStates {}

class UpdateUserInformationErrorState extends UserStates {
  final String error;
  UpdateUserInformationErrorState({required this.error});
}

class GetUserDataLoadingState extends UserStates {}

class GetUserDataSuccessState extends UserStates {}

class GetUserDataErrorState extends UserStates {
  final String error;
  GetUserDataErrorState({required this.error});
}
