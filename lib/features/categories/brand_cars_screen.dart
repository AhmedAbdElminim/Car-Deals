import 'package:car_deals/controllers/categories_controller/categories_cubit.dart';
import 'package:car_deals/controllers/categories_controller/categories_states.dart';
import 'package:car_deals/features/categories/widgets/brand_cars_screen_argument.dart';
import 'package:car_deals/features/categories/widgets/empty_category_screen.dart';
import 'package:car_deals/features/no_internet/no_internet_screen.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/categories/widgets/car_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandCarsScreen extends StatelessWidget {
  const BrandCarsScreen({Key? key}) : super(key: key);
  static const String brandCarsScreenId = 'BrandCarsScreenId';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as BrandCarsArgument;
    return BlocProvider(
      create: (context) => CategoriesCubit()
        ..getCategories(carBrand: args.carBrand, carType: args.carType),
      child: BlocConsumer<CategoriesCubit, CategoriesStates>(
        listener: (context, state) {
          if (state is GetCategoriesErrorStates) {
            showMyDialog(context: context, msg: '');
          }
          if (state is GetCategoriesInternetConnectionErrorStates) {
            showInternetConnectionDialog(context: context);
          }
        },
        builder: (context, state) {
          var cubit = CategoriesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue[900],
              title: Text(args.carBrand.toUpperCase()),
            ),
            body: state is GetCategoriesLoadingStates
                ? const Center(child: LoadingWidget(loadingNum: 1))
                : state is GetCategoriesInternetConnectionErrorStates
                    ? const NoInternetScreen()
                    : cubit.carList.isEmpty
                        ? const EmptyCategoryScreen()
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => CarCardComponent(
                              carModel: cubit.carList[index],
                            ),
                            itemCount: cubit.carList.length,
                          ),
          );
        },
      ),
    );
  }
}
