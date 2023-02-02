import 'package:car_deals/controllers/home_controller/home_cubit.dart';
import 'package:car_deals/controllers/home_controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/home/widgets/banner_widget.dart';
import 'package:car_deals/features/home/widgets/car_ads_component.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../shared/component/constants.dart';
import '../../shared/component/widgets.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>HomeCubit()..getUserData(userId: uId),
    
    child: BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('${getLang(context, "home_appbar_title")}'),
            actions: [
              IconButton(
                  onPressed: () {
                    defaultNavigate(context, SearchScreen.searchScreenId);
                  },
                  icon: const Icon(UniconsLine.search))
            ],
          ),
          body: ListView(
            children: [
              const BannerWidget(),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const CarAdsComponent(),
                itemCount: 20,
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
