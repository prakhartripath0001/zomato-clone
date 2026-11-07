import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/add_filter_widget.dart';
import 'package:zomato_clone/features/home/home/widgets/recipe_item_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_item_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/screens/restaurant_page_screen.dart';

class _BiryaniRestaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String speciality;
  final String foodType;
  final double price;
  final Pair<int, int> deliveryTime;
  final double distance;
  final String discount;

  const _BiryaniRestaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.speciality,
    required this.foodType,
    required this.price,
    required this.deliveryTime,
    required this.distance,
    required this.discount,
  });
}

class RestaurantsScreen extends ConsumerStatefulWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends ConsumerState<RestaurantsScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  var _currentSelectedItem = 0;

  static const List<_BiryaniRestaurant> _restaurants = [
    _BiryaniRestaurant(
      name: "Bawarchi Restaurant",
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
      rating: 4.4,
      speciality: "Hyderabadi Biryani",
      foodType: "North Indian",
      price: 350,
      deliveryTime: Pair(25, 30),
      distance: 2400,
      discount: "50% OFF up to ₹100",
    ),
    _BiryaniRestaurant(
      name: "Biryani By Kilo",
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
      rating: 4.5,
      speciality: "Dum Biryani",
      foodType: "Mughlai",
      price: 420,
      deliveryTime: Pair(30, 35),
      distance: 3100,
      discount: "₹125 OFF ABOVE ₹399",
    ),
    _BiryaniRestaurant(
      name: "Paradise Biryani",
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
      rating: 4.3,
      speciality: "Authentic Biryani",
      foodType: "Hyderabadi",
      price: 320,
      deliveryTime: Pair(20, 25),
      distance: 1800,
      discount: "40% OFF up to ₹80",
    ),
    _BiryaniRestaurant(
      name: "Behrouz Biryani",
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
      rating: 4.4,
      speciality: "Royal Biryani",
      foodType: "Persian & Mughlai",
      price: 390,
      deliveryTime: Pair(25, 30),
      distance: 2600,
      discount: "Flat ₹100 OFF",
    ),
    _BiryaniRestaurant(
      name: "Bikanervala Dum Biryani",
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
      rating: 4.2,
      speciality: "Veg Dum Biryani",
      foodType: "Pure Veg",
      price: 220,
      deliveryTime: Pair(20, 25),
      distance: 1500,
      discount: "20% OFF",
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      cacheExtent: 500,
      slivers: [
        SliverAppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 44,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  AddFilterWidget(
                    icon: "assets/images/filter_icon.png",
                    tag: "Sort",
                    hasMultiOption: true,
                    onClick: () {},
                  ),
                  AddFilterWidget(tag: "Nearest", onClick: () {}),
                  AddFilterWidget(tag: "Rating 4.0+", onClick: () {}),
                  AddFilterWidget(tag: "Pure Veg", onClick: () {}),
                ],
              ),
            ),
          ),
          backgroundColor: white,
          elevation: 0,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: TabBar(
              padding: const EdgeInsets.only(left: 10),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              controller: controller,
              isScrollable: true,
              indicatorColor: primaryColor,
              indicatorWeight: 2.5,
              tabs: List.generate(
                6,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RecipeItemWidget(
                    recipeName: "Biryani",
                    recipeImage: "assets/images/biryani_icon.png",
                    isSelected: _currentSelectedItem == index,
                  ),
                ),
              ),
              onTap: (tab) {
                setState(() {
                  controller.index = tab;
                  _currentSelectedItem = tab;
                });
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 14),
            child: Text(
              "ALL RESTAURANTS\nDELIVERING BIRYANI",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: grey,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverList.builder(
          itemCount: _restaurants.length,
          itemBuilder: (context, index) {
            final item = _restaurants[index];
            return RestaurantItemWidget(
              imageUrl: item.imageUrl,
              restaurantName: item.name,
              isFavorite: index % 2 == 0,
              rating: item.rating,
              speciality: item.speciality,
              foodType: item.foodType,
              lowestPriceOfItem: item.price,
              deliveryTime: item.deliveryTime,
              distance: item.distance,
              discount: item.discount,
              onClick: (restaurant) {
                Navigator.of(context, rootNavigator: true).pushNamed(RestaurantPageScreen.routeName);
              },
            );
          },
        ),
      ],
    );
  }
}
