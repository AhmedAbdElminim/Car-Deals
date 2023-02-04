import 'package:car_deals/controllers/home_controller/home_cubit.dart';
import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/home/widgets/banner_widget.dart';
import 'package:car_deals/features/home/widgets/car_ads_component.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import '../../shared/component/loading_widget.dart';
import '../../shared/component/widgets.dart';
import '../../shared/style/colors.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCars(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${getLang(context, "home_appbar_title")}'),
              actions: [
                IconButton(
                    onPressed: () {
                      defaultNavigate(
                          context: context,
                          screenName: SearchScreen.searchScreenId);
                    },
                    icon: const Icon(UniconsLine.search))
              ],
            ),
            body: state is HomeGetCarsLoadingState
                ? const Center(
                    child: LoadingWidget(
                      loadingNum: 1,
                    ),
                  )
                : ListView(
                    children: [
                      const BannerWidget(),
                      const SizedBox(
                        height: 10,
                      ),

                      for (int index = 0;
                          index < cubit.carsList.length;
                          index++)
                        CarAdsComponent(
                          carModel: cubit.carsList[index],
                        )

                      // ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) => CarAdsComponent(
                      //     carModel: cubit.carsList[index],
                      //   ),
                      //   itemCount: cubit.carsList.length,
                      // ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
