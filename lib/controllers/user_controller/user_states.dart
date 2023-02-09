abstract class UserStates {}

class UserInitialState extends UserStates {}

class UpdateUserInformationLoadingState extends UserStates {}

class UpdateUserInformationSuccessState extends UserStates {}

class UpdateUserInformationErrorState extends UserStates {
  final String error;
  UpdateUserInformationErrorState({required this.error});
}
