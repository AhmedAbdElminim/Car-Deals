abstract class CategoriesStates {}

class CategoriesInitialStates extends CategoriesStates {}

class GetCategoriesLoadingStates extends CategoriesStates {}

class GetCategoriesSuccessStates extends CategoriesStates {}

class GetCategoriesErrorStates extends CategoriesStates {
  final String error;
  GetCategoriesErrorStates({required this.error});
}

class GetCategoriesInternetConnectionErrorStates extends CategoriesStates {}
