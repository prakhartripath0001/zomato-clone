import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        memCacheWidth: width.isFinite ? (width * 2).toInt().clamp(100, 1000) : null,
        memCacheHeight: height.isFinite ? (height * 2).toInt().clamp(100, 1000) : null,
        placeholder: (context, url) => Container(
          color: ghostWhite,
          child: const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: primaryColor),
            ),
          ),
        ),
        errorWidget: (context, _, __) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: primaryColor,
                  size: 24,
                ),
                SizedBox(height: 4),
                Text(
                  "Image unavailable",
                  style: TextStyle(fontSize: 11, color: grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
