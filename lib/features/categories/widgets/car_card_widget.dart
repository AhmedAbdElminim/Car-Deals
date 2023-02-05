import 'package:car_deals/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/cached_network_image_component.dart';

import '../../../shared/component/widgets.dart';
import '../../car_details/car_details_screen.dart';
import '../../car_details/components/car_details_argument.dart';

class CarCardComponent extends StatelessWidget {
  const CarCardComponent({Key? key, required this.carModel}) : super(key: key);
  final CarModel carModel;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          onTap: () {
            /// TODO : NAVIGATE TO  CAR DETAILS
            defaultNavigate(
                context: context,
                screenName: CarDetailScreen.carDetailScreen,
                args: CarDetailsArgument(carId: carModel.carId));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CacheNetworkImageWidget(
                  imageHeight: 175,
                  imageWidth: screenWidth / 3,
                  imagePath: carModel.carImage,
                ),
              ),
              // const SizedBox(
              //   width: 2,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage(
                                  'assets/images/app_icons/brandIcon.png')),
                          Text('   ${carModel.carBrand}  ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // color: Colors.blue[900],
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage(
                                  'assets/images/app_icons/model.png')),
                          Text('   ${carModel.carName}  ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // color: Colors.blue[900],
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/app_icons/year.png')),
                              Text('   ${carModel.carModel}  ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      // color: Colors.blue[900],
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/app_icons/coloricon.png')),
                              Text('   ${carModel.carColor}  ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      // color: Colors.blue[900],
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage(
                                  'assets/images/app_icons/price.png')),
                          Text('   ${carModel.carPrice} EGP  ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // color: Colors.blue[900],
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
