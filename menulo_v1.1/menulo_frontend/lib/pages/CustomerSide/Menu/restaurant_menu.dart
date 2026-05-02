import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/CustomerSide/Menu/product_reviews.dart';
import 'package:menulo/pages/CustomerSide/Menu/resturant_reviews.dart';

class RestaurantMenuPage extends StatefulWidget {
  const RestaurantMenuPage({super.key});

  @override
  State<RestaurantMenuPage> createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  int _selectedCategoryIndex = 2;

  final List<String> _categories = [
    "All",
    "Chicken",
    "Burger",
    "Pizza",
    "Salads",
    "Drinks",
    "Green Menu",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/restaurant_mock_up.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.comment_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestaurantReviewsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: 20,
                  right: 20,
                  child: _buildInfoCard(),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gabarito',
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildFoodCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Yener Kitchen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gabarito',
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.brandColor,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "4.5 (149)",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.brandColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
              Text(
                " Ataşehir, İstanbul",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'Gabarito',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Lorem ipsum dolor sit amet consectetur. Commodo ultrices dis suspendisse ornare est.",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSmallChip(Icons.attach_money, "Budget"),
              const SizedBox(width: 10),
              _buildSmallChip(Icons.access_time, "09.00 - 22.00"),
              const SizedBox(width: 48),
              const Icon(Icons.favorite_border, color: Colors.red, size: 28),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    bool isSelected = _selectedCategoryIndex == index;
    String categoryName = _categories[index];

    Color normalColor = categoryName == "Green Menu"
        ? Colors.green
        : Colors.grey;

    Color textColor = isSelected ? AppColors.brandColor : normalColor;

    return GestureDetector(
      onTap: () => setState(() => _selectedCategoryIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              categoryName,
              style: TextStyle(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: 'Gabarito',
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: AppColors.brandColor,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.asset(
                  "assets/images/food_mock.jpg",
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.brandColor,
                        size: 14,
                      ),
                      const Text(
                        " 4.5",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chicken Special",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Gabarito',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas pulvinar tristique hac.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: 'Gabarito',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$ 289.90",
                      style: TextStyle(
                        color: AppColors.brandColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductReviewsPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Comments",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: 'Gabarito',
            ),
          ),
        ],
      ),
    );
  }
}