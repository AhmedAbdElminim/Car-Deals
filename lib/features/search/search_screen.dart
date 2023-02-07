import 'package:car_deals/controllers/search_controller/search_cubit.dart';
import 'package:car_deals/controllers/search_controller/search_states.dart';
import 'package:car_deals/features/search/search_screen_argument.dart';
import 'package:car_deals/features/search/widgets/full_widget.dart';
import 'package:car_deals/features/search/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/search/widgets/empty_search_widget.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/car_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const String searchScreenId = 'SearchScreenId';
  final TextEditingController filterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context)!.settings.arguments as SearchScreenArgument;

    return BlocProvider(
      create: (context) => SearchCubit()
        ..runFilter(
            enteredKeyword: '',
            allCars: args.carsList,
            keyFilter: filterController),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: screenHeight * .3,
                    width: screenWidth,
                    color: defaultColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: defaultColor,
                                  child: const Center(
                                      child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: cubit.isBrand,
                                    onChanged: (value) {
                                      cubit.changeSearchFilter();
                                    },
                                    checkColor: Colors.white,
                                    side: const BorderSide(color: Colors.white),
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                  Text(
                                    '${getLang(context, 'search_brand')}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: !cubit.isBrand,
                                    onChanged: (value) {
                                      cubit.changeSearchFilter();
                                    },
                                    checkColor: Colors.white,
                                    side: const BorderSide(color: Colors.white),
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                  Text(
                                    '${getLang(context, 'search_name')}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: filterController,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              cubit.runFilter(
                                  enteredKeyword: value,
                                  allCars: args.carsList,
                                  keyFilter: filterController);
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: '${getLang(context, 'search')}',
                              hintStyle: const TextStyle(color: Colors.white),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  //width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is SearchLoadingState) const EmptySearchWidget(),
                  if (state is SearchSuccessState && cubit.foundCars.isNotEmpty)
                    Flexible(
                      child: ListView(
                        children: List.generate(
                            cubit.foundCars.length,
                            (index) => FullWidget(
                                  carModel: cubit.foundCars[index],
                                )),
                      ),
                    ),
                  if (state is SearchSuccessState && cubit.foundCars.isEmpty)
                    const NotFoundWidget(),
                ],
              ));
        },
      ),
    );
  }
}
