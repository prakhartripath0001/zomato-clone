import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/custom_dashed_divider.dart';
import 'package:zomato_clone/common/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_clone/common/widgets/discount_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_name_and_rating_widget.dart';

class RestaurantItemWidget extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final bool isFavorite;
  final double rating;
  final String speciality;
  final String foodType;
  final double lowestPriceOfItem;
  final Pair<int, int> deliveryTime;
  final double distance;
  final String discount;
  final Function(String) onClick;

  const RestaurantItemWidget({
    Key? key,
    required this.imageUrl,
    required this.restaurantName,
    required this.isFavorite,
    required this.rating,
    required this.speciality,
    required this.foodType,
    required this.lowestPriceOfItem,
    required this.deliveryTime,
    required this.distance,
    required this.discount,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => onClick(restaurantName),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 18),
        elevation: 1.5,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  memCacheWidth: 600,
                  memCacheHeight: 400,
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: ghostWhite,
                    child: const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    color: ghostWhite,
                    child: const Center(
                      child: Icon(
                        Icons.restaurant_rounded,
                        color: midLightGrey,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBlack.withValues(alpha: 0.35),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                          onPressed: () {},
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: isFavorite ? primaryColor : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBlack.withValues(alpha: 0.35),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  RestaurantNameAndRatingWidget(
                    restaurantName: restaurantName,
                    rating: rating,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          speciality,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 13,
                            color: grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.circle,
                            size: 4,
                            color: midGrey,
                          ),
                        ),
                        Text(
                          foodType,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 13,
                            color: grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.circle,
                            size: 4,
                            color: midGrey,
                          ),
                        ),
                        Text(
                          "₹${lowestPriceOfItem.toInt()} for one",
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 13,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DeliveryTimeAndDistanceWidget(
                    deliveryTime: deliveryTime,
                    distance: distance,
                  ),
                  const CustomDashedDivider(),
                  DiscountWidget(discount: discount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
