import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/screens/restaurant_page_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search-screen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchItem {
  final String title;
  final String subtitle;
  final String price;
  final double rating;
  final String time;
  final bool isVeg;
  final bool isRestaurant;
  final String imageUrl;

  const _SearchItem({
    required this.title,
    required this.subtitle,
    this.price = "",
    required this.rating,
    required this.time,
    this.isVeg = true,
    this.isRestaurant = false,
    required this.imageUrl,
  });
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = "";

  static const List<String> _popularKeywords = [
    "Biryani",
    "Pizza",
    "Burger",
    "Paneer",
    "Chicken",
    "Dosa",
    "Momos",
    "Rolls",
    "Chowmein",
    "Cake",
    "Thali",
  ];

  static const List<_SearchItem> _catalog = [
    _SearchItem(
      title: "Hyderabadi Chicken Biryani",
      subtitle: "Bawarchi Restaurant",
      price: "₹249",
      rating: 4.4,
      time: "30 mins",
      isVeg: false,
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
    ),
    _SearchItem(
      title: "Dum Paneer Biryani",
      subtitle: "Bikanervala",
      price: "₹220",
      rating: 4.2,
      time: "25 mins",
      isVeg: true,
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
    ),
    _SearchItem(
      title: "Paneer Butter Masala",
      subtitle: "Haldiram's",
      price: "₹260",
      rating: 4.3,
      time: "20 mins",
      isVeg: true,
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
    ),
    _SearchItem(
      title: "Butter Chicken",
      subtitle: "Moti Mahal Delux",
      price: "₹340",
      rating: 4.5,
      time: "35 mins",
      isVeg: false,
      imageUrl: "https://madscookhouse.com/wp-content/uploads/2020/10/Paneer-Butter-Masala-Nut-Free.jpg",
    ),
    _SearchItem(
      title: "Crispy Double Veg Burger",
      subtitle: "Burger King",
      price: "₹149",
      rating: 4.2,
      time: "20 mins",
      isVeg: true,
      imageUrl: "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
    ),
    _SearchItem(
      title: "Hot & Crispy Chicken Burger",
      subtitle: "KFC",
      price: "₹189",
      rating: 4.3,
      time: "25 mins",
      isVeg: false,
      imageUrl: "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
    ),
    _SearchItem(
      title: "Margherita Pizza",
      subtitle: "Domino's Pizza",
      price: "₹199",
      rating: 4.3,
      time: "25 mins",
      isVeg: true,
      imageUrl: "https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg",
    ),
    _SearchItem(
      title: "Farmhouse Deluxe Pizza",
      subtitle: "Pizza Hut",
      price: "₹349",
      rating: 4.2,
      time: "30 mins",
      isVeg: true,
      imageUrl: "https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg",
    ),
    _SearchItem(
      title: "Mysore Masala Dosa",
      subtitle: "Sagar Ratna",
      price: "₹150",
      rating: 4.6,
      time: "20 mins",
      isVeg: true,
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
    ),
    _SearchItem(
      title: "Steamed Veg Momos (6 pcs)",
      subtitle: "Wow! Momo",
      price: "₹130",
      rating: 4.2,
      time: "20 mins",
      isVeg: true,
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
    ),
    _SearchItem(
      title: "Fried Chicken Momos (6 pcs)",
      subtitle: "Wow! Momo",
      price: "₹160",
      rating: 4.4,
      time: "20 mins",
      isVeg: false,
      imageUrl: "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
    ),
    _SearchItem(
      title: "Bawarchi Restaurant",
      subtitle: "Biryani • North Indian • Mughlai",
      price: "₹300 for one",
      rating: 4.4,
      time: "30 mins",
      isRestaurant: true,
      imageUrl: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
    ),
    _SearchItem(
      title: "Burger King",
      subtitle: "Burgers • American • Fast Food",
      price: "₹200 for one",
      rating: 4.2,
      time: "20 mins",
      isRestaurant: true,
      imageUrl: "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
    ),
    _SearchItem(
      title: "Domino's Pizza",
      subtitle: "Pizzas • Italian • Fast Food",
      price: "₹250 for one",
      rating: 4.3,
      time: "25 mins",
      isRestaurant: true,
      imageUrl: "https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg",
    ),
    _SearchItem(
      title: "Haldiram's",
      subtitle: "North Indian • Street Food • Sweets",
      price: "₹200 for one",
      rating: 4.3,
      time: "25 mins",
      isRestaurant: true,
      imageUrl: "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<_SearchItem> get _filteredItems {
    final cleanQuery = _query.trim().toLowerCase();
    if (cleanQuery.isEmpty) return [];
    return _catalog.where((item) {
      final inTitle = item.title.toLowerCase().contains(cleanQuery);
      final inSubtitle = item.subtitle.toLowerCase().contains(cleanQuery);
      return inTitle || inSubtitle;
    }).toList();
  }

  void _onKeywordTap(String keyword) {
    _searchController.text = keyword;
    _searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: keyword.length),
    );
    setState(() {
      _query = keyword;
    });
  }

  void _navigateToRestaurant() {
    Navigator.pushNamed(context, RestaurantPageScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final results = _filteredItems;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 0,
        leading: IconButton(
          splashRadius: 22,
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: darkBlack, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 44,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: ghostWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: lightGrey),
          ),
          child: Row(
            children: [
              const Icon(Icons.search_rounded, color: primaryColor, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  style: textTheme.bodyLarge?.copyWith(fontSize: 16, color: darkBlack),
                  decoration: InputDecoration(
                    hintText: "Restaurant name or a dish...",
                    hintStyle: textTheme.bodyLarge?.copyWith(color: midLightGrey, fontSize: 15),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _query = value;
                    });
                  },
                ),
              ),
              if (_query.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() {
                      _query = "";
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.close_rounded, color: grey, size: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: _query.trim().isEmpty
          ? _buildSuggestions(textTheme)
          : _buildSearchResults(results, textTheme),
    );
  }

  Widget _buildSuggestions(TextTheme textTheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.trending_up_rounded, color: primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                "Popular Cuisines & Dishes",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularKeywords.map((keyword) {
              return ActionChip(
                backgroundColor: ghostWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: lightGrey),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                avatar: const Icon(Icons.search_rounded, size: 16, color: grey),
                label: Text(
                  keyword,
                  style: textTheme.bodyMedium?.copyWith(
                    color: darkBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => _onKeywordTap(keyword),
              );
            }).toList(),
          ),
          const SizedBox(height: 28),
          Text(
            "Frequently Ordered",
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (_, __) => const Divider(height: 16, color: lightGrey),
            itemBuilder: (context, index) {
              final item = _catalog[index];
              return _buildItemRow(item, textTheme);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<_SearchItem> results, TextTheme textTheme) {
    if (results.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off_rounded, size: 64, color: midLightGrey),
              const SizedBox(height: 16),
              Text(
                "No results found for \"$_query\"",
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: darkBlack,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Try searching for Biryani, Burger, Pizza, Paneer, or a restaurant name.",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(color: grey),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(height: 16, color: lightGrey),
      itemBuilder: (context, index) {
        return _buildItemRow(results[index], textTheme);
      },
    );
  }

  Widget _buildItemRow(_SearchItem item, TextTheme textTheme) {
    return InkWell(
      onTap: _navigateToRestaurant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: lightGrey),
                errorWidget: (context, url, error) => Container(
                  color: lightGrey,
                  child: const Icon(Icons.fastfood, color: grey),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!item.isRestaurant)
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: VegOrNonVegIconWidget(isVeg: item.isVeg, size: 14),
                        ),
                      Expanded(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: darkBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(color: grey, fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(Icons.star, color: Colors.white, size: 10),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "•  ${item.time}",
                        style: textTheme.bodySmall?.copyWith(color: grey, fontSize: 12),
                      ),
                      if (item.price.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text(
                          "•  ${item.price}",
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: darkBlack,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right_rounded, color: grey),
          ],
        ),
      ),
    );
  }
}
