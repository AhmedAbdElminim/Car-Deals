abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String error;
  SearchErrorState({required this.error});
}

class ChangeSearchFilterState extends SearchStates {}
