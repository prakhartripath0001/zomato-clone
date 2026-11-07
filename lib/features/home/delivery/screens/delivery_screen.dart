import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/add_filter_widget.dart';
import 'package:zomato_clone/common/widgets/circular_image.dart';
import 'package:zomato_clone/common/widgets/search_bar_widget.dart';
import 'package:zomato_clone/features/home/delivery_location/screens/choose_delivery_location_screen.dart';
import 'package:zomato_clone/features/home/home/widgets/recipe_item_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_item_widget.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/features/home/restaurant_page/screens/restaurant_page_screen.dart';
import 'package:zomato_clone/features/home/restaurants_and_dishes/restaurants_and_dishes_screen.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/features/home/search_screen/search_screen.dart';
import 'package:zomato_clone/l10n/app_localizations.dart';
import 'package:zomato_clone/navigation/navigation.dart';

class _RestaurantData {
  final String name;
  final String imageUrl;
  final double rating;
  final String speciality;
  final String foodType;
  final double price;
  final Pair<int, int> deliveryTime;
  final double distance;
  final String discount;

  const _RestaurantData({
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

class DeliveryScreen extends ConsumerStatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends ConsumerState<DeliveryScreen> {
  var location = "Delhi";
  final searchController = TextEditingController();

  static const List<_RestaurantData> _restaurants = [
    _RestaurantData(
      name: "Bawarchi Restaurant",
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
      rating: 4.4,
      speciality: "Biryani",
      foodType: "North Indian",
      price: 350,
      deliveryTime: Pair(25, 30),
      distance: 2400,
      discount: "50% OFF up to ₹100",
    ),
    _RestaurantData(
      name: "Burger King",
      imageUrl: "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
      rating: 4.2,
      speciality: "Burgers",
      foodType: "Fast Food",
      price: 199,
      deliveryTime: Pair(20, 25),
      distance: 1800,
      discount: "60% OFF up to ₹120",
    ),
    _RestaurantData(
      name: "Domino's Pizza",
      imageUrl: "https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg",
      rating: 4.3,
      speciality: "Pizza",
      foodType: "Italian",
      price: 249,
      deliveryTime: Pair(25, 30),
      distance: 3100,
      discount: "₹125 OFF ABOVE ₹399",
    ),
    _RestaurantData(
      name: "Haldiram's",
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
      rating: 4.3,
      speciality: "North Indian",
      foodType: "Sweets",
      price: 200,
      deliveryTime: Pair(20, 25),
      distance: 2000,
      discount: "40% OFF up to ₹80",
    ),
    _RestaurantData(
      name: "KFC",
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
      rating: 4.3,
      speciality: "Fried Chicken",
      foodType: "Fast Food",
      price: 299,
      deliveryTime: Pair(25, 30),
      distance: 3500,
      discount: "20% OFF up to ₹50",
    ),
    _RestaurantData(
      name: "Punjab Grill",
      imageUrl: "https://madscookhouse.com/wp-content/uploads/2020/10/Paneer-Butter-Masala-Nut-Free.jpg",
      rating: 4.5,
      speciality: "North Indian",
      foodType: "Mughlai",
      price: 450,
      deliveryTime: Pair(35, 40),
      distance: 4200,
      discount: "Flat ₹100 OFF",
    ),
    _RestaurantData(
      name: "Sagar Ratna",
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
      rating: 4.6,
      speciality: "South Indian",
      foodType: "Dosa",
      price: 180,
      deliveryTime: Pair(20, 25),
      distance: 1500,
      discount: "30% OFF up to ₹75",
    ),
    _RestaurantData(
      name: "Wow! Momo",
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
      rating: 4.4,
      speciality: "Momos",
      foodType: "Tibetan",
      price: 150,
      deliveryTime: Pair(15, 20),
      distance: 1200,
      discount: "Buy 1 Get 1 Free",
    ),
    _RestaurantData(
      name: "Moti Mahal Delux",
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
      rating: 4.4,
      speciality: "Tandoori",
      foodType: "North Indian",
      price: 380,
      deliveryTime: Pair(30, 35),
      distance: 3800,
      discount: "50% OFF up to ₹100",
    ),
    _RestaurantData(
      name: "Bikanervala",
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
      rating: 4.2,
      speciality: "Snacks",
      foodType: "Street Food",
      price: 160,
      deliveryTime: Pair(20, 25),
      distance: 2100,
      discount: "20% OFF",
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      scrollCacheExtent: ScrollCacheExtent.pixels(500), slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChooseDeliveryLocationScreen.routeName);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: primaryColorVariant,
                        size: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: location, style: textTheme.displaySmall),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "India",
                              style: textTheme.labelSmall?.copyWith(
                                color: grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  splashColor: lightGrey,
                  onTap: () {
                    showLanguageSelectionBottomSheet(context, ref);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.symmetric(vertical: 5).copyWith(right: 2, left: 1),
                    decoration: const BoxDecoration(
                      color: transparent,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: midGrey,
                          width: 1,
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.asset(
                      "assets/images/change_language_icon.png",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    ref.watch(homeNavigation.notifier).state = 1;
                  },
                  child: const CircularImage(
                    imageLink: "https://cdn.pixabay.com/photo/2018/02/08/22/27/flower-3140492_1280.jpg",
                    radius: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverAppBar(
          title: SearchBarWidget(
            leading: Pair(
              Icons.search_rounded,
              () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
            ),
            hint: AppLocalizations.of(context)?.searchHint ?? "Restaurant name or a dish...",
            onClick: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: white,
          pinned: false,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      height: 140,
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage("assets/images/zomato_offer_icon.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 110,
                      padding: const EdgeInsets.all(15).copyWith(right: 0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.fromBorderSide(
                          BorderSide(color: lightGrey.withValues(alpha: 0.8), width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Offers",
                                style: textTheme.displaySmall,
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Up to 60% OFF, Flat Discounts, and other great offers",
                                  style: textTheme.labelMedium?.copyWith(
                                    color: midLightGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Lottie.asset(
                            "assets/lottie/offers_animation.json",
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(child: Container(height: 1, color: lightGrey)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "WHAT'S ON YOUR MIND?",
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: grey,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Expanded(child: Container(height: 1, color: lightGrey)),
                        ],
                      ),
                    ),
                    Container(
                      height: 220,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 15),
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                RecipeItemWidget(
                                  recipeName: "Biryani",
                                  recipeImage: "assets/images/biryani_icon.png",
                                  onClick: () {
                                    Navigator.pushNamed(context, RestaurantsAndDishesScreen.routeName);
                                  },
                                ),
                                const SizedBox(height: 12),
                                RecipeItemWidget(
                                  recipeName: "Fried Rice",
                                  recipeImage: "assets/images/fried_rice.png",
                                  onClick: () {
                                    Navigator.pushNamed(context, RestaurantsAndDishesScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: Container(height: 1, color: lightGrey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(bottom: 6),
                      child: Text(
                        "ALL RESTAURANTS",
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          color: grey,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    Expanded(child: Container(height: 1, color: lightGrey)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
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
                  AddFilterWidget(tag: "New Arrivals", onClick: () {}),
                  AddFilterWidget(tag: "Cuisines", hasMultiOption: true, onClick: () {}),
                ],
              ),
            ),
          ),
          backgroundColor: white,
          elevation: 0,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: Center(
              child: Text(
                "${_restaurants.length} restaurants delivering to you",
                style: textTheme.bodyLarge?.copyWith(
                  color: midLightGrey,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: _restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = _restaurants[index];
            return RestaurantItemWidget(
              imageUrl: restaurant.imageUrl,
              restaurantName: restaurant.name,
              isFavorite: index % 3 == 0,
              rating: restaurant.rating,
              speciality: restaurant.speciality,
              foodType: restaurant.foodType,
              lowestPriceOfItem: restaurant.price,
              deliveryTime: restaurant.deliveryTime,
              distance: restaurant.distance,
              discount: restaurant.discount,
              onClick: (name) {
                Navigator.of(context, rootNavigator: true).pushNamed(RestaurantPageScreen.routeName);
              },
            );
          },
        ),
      ],
    );
  }
}
