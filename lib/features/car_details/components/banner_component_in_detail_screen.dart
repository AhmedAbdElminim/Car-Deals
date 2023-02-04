import 'package:car_deals/shared/component/cached_network_image_component.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:car_deals/shared/style/colors.dart';

class BannerComponentInDetailScreen extends StatefulWidget {
  const BannerComponentInDetailScreen({required this.imageUrl, Key? key})
      : super(key: key);
  final String imageUrl;
  @override
  State<BannerComponentInDetailScreen> createState() =>
      _BannerComponentInDetailScreenState();
}

class _BannerComponentInDetailScreenState
    extends State<BannerComponentInDetailScreen> {
  int currentIndex = 0;
  // List<String> imagesPath = [
  //   widget.imageUrl,
  //
  // ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 220,
      width: screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CacheNetworkImageWidget(
              imageHeight: 220,
              imageWidth: double.infinity,
              imagePath: widget.imageUrl);
        },
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        autoplay: false,
        itemCount: 1,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Colors.white, activeColor: defaultColor),
        ),
      ),
    );
  }
}
