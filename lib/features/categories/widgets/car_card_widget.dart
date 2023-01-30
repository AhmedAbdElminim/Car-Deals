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
            defaultNavigate(context, CarDetailScreen.carDetailScreen);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CacheNetworkImageWidget(
                imageHeight: 175,
                imageWidth: screenWidth / 3,
                imagePath:
                    'https://www.carlogos.org/car-logos/lamborghini-logo-1100x1200.png',
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Brand : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Mercedes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Type : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'S-Class',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Model : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: '2019',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Color : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Red',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Price : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: '1000000',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 20)),
                          const TextSpan(
                              text: ' EGP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20)),
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
