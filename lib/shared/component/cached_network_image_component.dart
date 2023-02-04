import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CacheNetworkImageWidget extends StatelessWidget {
  const CacheNetworkImageWidget(
      {Key? key,
      required this.imageHeight,
      required this.imageWidth,
      required this.imagePath})
      : super(key: key);
  final double imageWidth;
  final double imageHeight;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0), topLeft: Radius.circular(0.0)),
      child: CachedNetworkImage(
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
        imageUrl: imagePath,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
