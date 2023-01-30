import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int currentIndex = 0;
  List<String> imagesPath = [
    'assets/images/brands_logo/audi.png',
    'assets/images/brands_logo/bmw-logo.png',
    'assets/images/brands_logo/porsche.png',
    'assets/images/brands_logo/Volkswagen.png',
    'assets/images/brands_logo/Mercedes-Benz.png',
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * .25,
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
              color: Colors.white, activeColor: Colors.blue[900]),
        ),
      ),
    );
  }
}
