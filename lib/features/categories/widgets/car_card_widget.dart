import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/cached_network_image_component.dart';

import '../../../shared/component/widgets.dart';
import '../../car_details/car_details_screen.dart';

class CarCardComponent extends StatelessWidget {
  const CarCardComponent({Key? key}) : super(key: key);

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
                context: context, screenName: CarDetailScreen.carDetailScreen);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CacheNetworkImageWidget(
                imageHeight: 175,
                imageWidth: screenWidth / 3,
                imagePath:
                    'https://i.pinimg.com/236x/4d/b7/1e/4db71eb5013211a120d0bd40ba98ce2d.jpg',
              ),
              const SizedBox(
                width: 5,
              ),
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
                        children: const [
                          Image(
                              image: AssetImage(
                                  'assets/images/app_icons/brandIcon.png')),
                          Text('   Mercedes  ',
                              style: TextStyle(
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
                        children: const [
                          Image(
                              image: AssetImage(
                                  'assets/images/app_icons/model.png')),
                          Text('   S-Class  ',
                              style: TextStyle(
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
                            children: const [
                              Image(
                                  image: AssetImage(
                                      'assets/images/app_icons/year.png')),
                              Text('   2022  ',
                                  style: TextStyle(
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
                            children: const [
                              Image(
                                  image: AssetImage(
                                      'assets/images/app_icons/coloricon.png')),
                              Text('   Red  ',
                                  style: TextStyle(
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
                        children: const [
                          Image(
                              image: AssetImage(
                                  'assets/images/app_icons/price.png')),
                          Text('   35000 EGP  ',
                              style: TextStyle(
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
