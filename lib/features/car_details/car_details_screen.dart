import 'package:flutter/material.dart';
import 'package:car_deals/features/car_details/put_price_screen.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/widgets.dart';
import 'package:car_deals/shared/style/colors.dart';

import 'components/banner_component_in_detail_screen.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({Key? key}) : super(key: key);
  static const String carDetailScreen = 'CarDetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: defaultColor!, width: 4)),
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Audi SQ5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Audi SQ5',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text(
                  '2022 - Edition',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BannerComponentInDetailScreen(),
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
                        children: const [
                          Image(
                            image: AssetImage(
                                'assets/images/app_icons/transmission.png'),
                            height: 90,
                            width: 90,
                          ),
                          Text(
                            'A',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${getLang(context, 'detail_transmission')}'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${getLang(context, 'auto')}'),
                    ],
                  ),
                  Column(
                    children: [
                      const Image(
                        image:
                            AssetImage('assets/images/app_icons/capacity.png'),
                        height: 90,
                        width: 90,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${getLang(context, 'detail_capacity')}'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('2500 ${getLang(context, 'cc')}'),
                    ],
                  ),
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/app_icons/speed.png'),
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
                      Text('5.0 ${getLang(context, 'sec')}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'فابركة بأكمل كسر زيرو أعلى فئة بحالة زيرو\nفابركة بأكمل كسر زيرو أعلى فئة بحالة زيرو\nفابركة بأكمل كسر زيرو أعلى فئة بحالة زيرو ',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
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
                            fontWeight: FontWeight.bold, color: defaultColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${getLang(context, 'detail_price')}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {
                      defaultNavigate(context, PutPriceScreen.putPriceScreenId);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        '${getLang(context, 'detail_apply_your_price')}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
  }
}
