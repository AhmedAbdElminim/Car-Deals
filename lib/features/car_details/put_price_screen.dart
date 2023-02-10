import 'package:car_deals/features/no_internet/no_internet_screen.dart';
import 'package:car_deals/shared/component/cached_network_image_component.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';

import '../../controllers/users_prices_controller/users_prices_cubit.dart';
import '../../controllers/users_prices_controller/users_prices_states.dart';
import '../../shared/component/loading_widget.dart';
import '../../shared/component/function.dart';
import 'components/car_prices_argument.dart';
import 'components/comment_item_component.dart';
import 'components/empty_prices_widget.dart';

class PutPriceScreen extends StatelessWidget {
  PutPriceScreen({Key? key}) : super(key: key);
  static const String putPriceScreenId = 'PutPriceScreenId';
  static final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CarPricesArgument;
    return BlocProvider(
      create: (context) => UsersPricesCubit()..getPricesList(carId: args.carId),
      child: BlocConsumer<UsersPricesCubit, UsersPricesStates>(
        listener: (context, state) {
          if (state is GetPricesErrorState) {
            showMyDialog(context: context, msg: '');
          }
          if(state is GetPricesInternetConnectionErrorState){
            showInternetConnectionDialog(context: context);
          }
        },
        builder: (context, state) {
          var cubit = UsersPricesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(args.carName),
            ),
            body: state is GetPricesLoadingState
                ? const Center(
                    child: LoadingWidget(
                    loadingNum: 1,
                  ))
                :state is GetPricesInternetConnectionErrorState?const NoInternetScreen(): Column(
                    children: [
                      // Image(
                      //   image: NetworkImage(args.carImage),
                      //   height: 200,
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                      CacheNetworkImageWidget(
                          imageHeight: 200,
                          imageWidth: double.infinity,
                          imagePath: args.carImage),
                      Flexible(
                          child: Padding(
                        padding: args.carExpired
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(
                                left: 20, right: 20, bottom: 80),
                        child: cubit.pricesList.isEmpty
                            ? const EmptyPriceWidget()
                            : ListView(
                                physics: const BouncingScrollPhysics(),
                                children: List.generate(
                                    cubit.pricesList.length,
                                    (index) => CommentItemComponent(
                                          userName:
                                              cubit.pricesList[index].userName,
                                          userPrice:
                                              cubit.pricesList[index].userPrice,
                                        )),
                              ),
                      )),
                    ],
                  ),
            bottomSheet: args.carExpired
                ? null
                : Container(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Form(
                            key: formKey,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: priceController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Price must not be empty";
                                }
                                if (priceController.text.toInt()! <
                                    args.initialPrice) {
                                  return "Price must be equal or greater than initial price";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText:
                                      '${getLang(context, 'enter_your_price')}'),
                            ),
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          if (state is PutPricesLoadingState)
                            const SizedBox(
                                height: 50,
                                child: LoadingWidget(loadingNum: 1)),
                          if (state is! PutPricesLoadingState)
                            MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.putPrice(
                                      userPrice: priceController.text.toInt()!,
                                      carId: args.carId);
                                }
                              },
                              color: defaultColor,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 21),
                                child: Text(
                                  '${getLang(context, 'submit')}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
