import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/shared/style/colors.dart';

class BannerComponentInDetailScreen extends StatefulWidget {
  const BannerComponentInDetailScreen({Key? key}) : super(key: key);

  @override
  State<BannerComponentInDetailScreen> createState() =>
      _BannerComponentInDetailScreenState();
}

class _BannerComponentInDetailScreenState
    extends State<BannerComponentInDetailScreen> {
  int currentIndex = 0;
  List<String> imagesPath = [
    'assets/images/onboarding/merc.jpg',
    'assets/images/onboarding/audicar.png',
    'assets/images/onboarding/merc.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 220,
      width: screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            imagesPath[currentIndex],
            fit: BoxFit.fill,
          );
        },
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        autoplay: true,
        itemCount: imagesPath.length,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Colors.white, activeColor: defaultColor),
        ),
      ),
    );
  }
}
