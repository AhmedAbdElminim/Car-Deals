import 'package:car_deals/controllers/home_controller/home_cubit.dart';
import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:car_deals/features/no_internet/no_internet_screen.dart';
import 'package:car_deals/shared/component/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/home/widgets/banner_widget.dart';
import 'package:car_deals/features/home/widgets/car_ads_component.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import '../../shared/component/constants.dart';
import '../../shared/component/loading_widget.dart';
import '../../shared/component/function.dart';
import '../search/search_screen.dart';
import '../search/search_screen_argument.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetUserDataErrorState) {
            showMyDialog(context: context, msg: '');
          }
          if (state is HomeGetUserDataInternetConnectionErrorState) {
            showInternetConnectionDialog(context: context).then((value) {
              HomeCubit.get(context).getUserData();
            });
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text('${getLang(context, "home_appbar_title")}'),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: PopupMenuButton<int>(
                      icon: Text(
                        cubit.categoriesType,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("All"),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text("OnGoing"),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text("Finished"),
                        ),
                      ],
//                      offset: Offset(0, 100),   ----->  change the position of the menu
                      color: Colors.white,
                      elevation: 2,

                      onSelected: (value) {
                        if (value == 1) {
                          cubit.changeCategories(categoriesTypeString: 'All');
                        } else if (value == 2) {
                          cubit.changeCategories(
                              categoriesTypeString: 'OnGoing');
                        } else if (value == 3) {
                          cubit.changeCategories(
                              categoriesTypeString: 'Finished');
                        }
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: state is HomeGetUserDataLoadingState
                        ? null
                        : () {
                            defaultNavigate(
                                context: context,
                                screenName: SearchScreen.searchScreenId,
                                args: SearchScreenArgument(
                                    carsList: cubit.carsList));
                          },
                    icon: const Icon(UniconsLine.search))
              ],
            ),
            body: state is HomeGetUserDataLoadingState
                ? const Center(
                    child: LoadingWidget(
                      loadingNum: 1,
                    ),
                  )
                : state is HomeGetUserDataInternetConnectionErrorState
                    ? const NoInternetScreen()
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const BannerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          if (cubit.categoriesType == 'All')
                            for (int index = 0;
                                index < cubit.carsList.length;
                                index++)
                              BadgeComponent(
                                isFinished: DateTime.now()
                                            .difference(DateTime.parse(cubit
                                                .carsList[index]
                                                .carPublishedDate))
                                            .inDays >
                                        7
                                    ? true
                                    : false,
                                remainingDays:
                                    '${7 - (DateTime.now().difference(DateTime.parse(cubit.carsList[index].carPublishedDate)).inDays)}',
                                child: CarAdsComponent(
                                  carModel: cubit.carsList[index],
                                ),
                              ),
                          if (cubit.categoriesType == 'OnGoing')
                            for (int index = 0;
                                index < cubit.onGoingCarsList.length;
                                index++)
                              BadgeComponent(
                                isFinished: DateTime.now()
                                            .difference(DateTime.parse(cubit
                                                .onGoingCarsList[index]
                                                .carPublishedDate))
                                            .inDays >
                                        7
                                    ? true
                                    : false,
                                remainingDays:
                                    '${7 - (DateTime.now().difference(DateTime.parse(cubit.onGoingCarsList[index].carPublishedDate)).inDays)}',
                                child: CarAdsComponent(
                                  carModel: cubit.onGoingCarsList[index],
                                ),
                              ),
                          if (cubit.categoriesType == 'Finished')
                            for (int index = 0;
                                index < cubit.finishedCarsList.length;
                                index++)
                              BadgeComponent(
                                isFinished: DateTime.now()
                                            .difference(DateTime.parse(cubit
                                                .finishedCarsList[index]
                                                .carPublishedDate))
                                            .inDays >
                                        7
                                    ? true
                                    : false,
                                remainingDays:
                                    '${7 - (DateTime.now().difference(DateTime.parse(cubit.finishedCarsList[index].carPublishedDate)).inDays)}',
                                child: CarAdsComponent(
                                  carModel: cubit.finishedCarsList[index],
                                ),
                              ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}
