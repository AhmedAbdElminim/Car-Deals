import 'package:car_deals/features/car_details/components/car_details_argument.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/features/car_details/put_price_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/car_detail_controller/car_detail_cubit.dart';
import '../../controllers/car_detail_controller/car_detail_states.dart';
import '../../shared/component/loading_widget.dart';
import 'components/banner_component_in_detail_screen.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({Key? key}) : super(key: key);
  static const String carDetailScreen = 'CarDetailScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CarDetailsArgument;

    return BlocProvider(
      create: (BuildContext context) =>
          CarDetailCubit()..getCarDetail(carId: args.carId),
      child: BlocConsumer<CarDetailCubit, CarDetailStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CarDetailCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: state is GetCarDetailLoadingState
                ? const Center(
                    child: LoadingWidget(
                    loadingNum: 1,
                  ))
                : SafeArea(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: defaultColor!, width: 4)),
                                  child: const Center(
                                    child: Icon(Icons.arrow_back_ios_rounded),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                cubit.carModel.carName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              cubit.carModel.carName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            subtitle: Text(
                              '${cubit.carModel.carModel} - Edition',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         BannerComponentInDetailScreen(imageUrl: cubit.carModel.carImage,),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/app_icons/transmission.png'),
                                        height: 90,
                                        width: 90,
                                      ),
                                      Text(
                                        cubit.carModel.carTransmission[0]
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${getLang(context, 'detail_transmission')}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${getLang(context, cubit.carModel.carTransmission.toLowerCase())}'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/app_icons/capacity.png'),
                                    height: 90,
                                    width: 90,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${getLang(context, 'detail_capacity')}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${cubit.carModel.carCapacity} ${getLang(context, 'cc')}'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/app_icons/speed.png'),
                                    height: 90,
                                    width: 90,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('${getLang(context, 'detail_0_100')}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${cubit.carModel.carSpeed} ${getLang(context, 'sec')}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            cubit.carModel.carDescription,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                          child: Divider(
                            color: defaultColor,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${getLang(context, 'detail_starting_price')}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: defaultColor),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${cubit.carModel.carPrice} ${getLang(context, 'detail_price')}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  defaultNavigate(
                                      context: context,
                                      screenName:
                                          PutPriceScreen.putPriceScreenId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: defaultColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    '${getLang(context, 'detail_apply_your_price')}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
