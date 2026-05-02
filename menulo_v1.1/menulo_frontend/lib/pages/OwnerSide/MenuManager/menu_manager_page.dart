import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/OwnerSide/MenuManager/product_reviews_owner.dart';
import 'package:menulo/pages/OwnerSide/MenuManager/restaurant_reviews_owner.dart';


import 'package:menulo/models/product_model.dart';
import 'package:menulo/data/mock_data.dart';

class MenuManagerPage extends StatefulWidget {
  const MenuManagerPage({super.key});

  @override
  State<MenuManagerPage> createState() => _MenuManagerPageState();
}

class _MenuManagerPageState extends State<MenuManagerPage> {
  int _selectedCategoryIndex = 2;

  
  final List<String> _categories = MockData.categories;

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      
                      image: AssetImage(MockData.currentRestaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.35)),
                ),
                Positioned(
                  top: 55,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 48,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gabarito',
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RestaurantReviewsOwnerPage(restaurant: MockData.currentRestaurant),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.comment_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 20,
                  right: 20,
                  child: _buildBusinessInfoCard(),
                ),
              ],
            ),

            const SizedBox(height: 75),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                  _buildEditMenuButton(),
                ],
              ),
            ),

            const SizedBox(height: 12),
            _buildCategoryList(),

            
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F4F8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                
                itemCount: MockData.mockProducts.length,
                itemBuilder: (context, index) {
                  
                  final product = MockData.mockProducts[index];
                  return _buildManagerFoodCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditMenuButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.brandColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Icon(Icons.edit_square, size: 18, color: AppColors.brandColor),
            SizedBox(width: 6),
            Text(
              "Edit Menu",
              style: TextStyle(
                color: AppColors.brandColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                fontFamily: 'Gabarito',
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildManagerFoodCard(Product product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
            child: Image.asset(
              product.imageUrl, 
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name, 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductReviewsOwnerPage(product: product),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.chat_bubble_outline,
                          color: AppColors.brandColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.description, 
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontFamily: 'Gabarito',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${product.price.toStringAsFixed(2)}", 
                        style: const TextStyle(
                          color: AppColors.brandColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                      _buildEditButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.brandColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.edit, color: Colors.white, size: 12),
          SizedBox(width: 4),
          Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gabarito',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessInfoCard() {
    
    final restaurant = MockData.currentRestaurant;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.name, 
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gabarito',
                ),
              ),
              _buildRatingBadge(restaurant.rating),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              Text(
                " ${restaurant.location}", 
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'Gabarito',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.description, 
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              height: 1.3,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildSmallChip(Icons.attach_money, restaurant.budgetLabel), 
              const SizedBox(width: 10),
              _buildSmallChip(Icons.access_time, restaurant.workingHours), 
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Text(
                    _categories[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.brandColor : Colors.grey.shade400,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2.5,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.brandColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRatingBadge(double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: AppColors.brandColor,
            size: 12,
          ),
          Text(
            " $rating", 
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.brandColor,
              fontFamily: 'Gabarito',
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
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.grey.shade500),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontFamily: 'Gabarito',
            ),
          ),
        ],
      ),
    );
  }
}