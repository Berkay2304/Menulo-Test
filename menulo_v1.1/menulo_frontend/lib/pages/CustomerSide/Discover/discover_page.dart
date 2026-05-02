import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/CustomerSide/Menu/restaurant_menu.dart';


import 'package:menulo/models/restaurant_model.dart';
import 'package:menulo/data/mock_data.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _showDetail = false;

  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  void _openDetail() {
    setState(() {
      _showDetail = true;
    });

    Future.delayed(const Duration(milliseconds: 50), () {
      if (_sheetController.isAttached) {
        _sheetController.animateTo(
          0.6,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _closeDetail() {
    setState(() {
      _showDetail = false;
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      if (_sheetController.isAttached) {
        _sheetController.animateTo(
          0.4,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_showDetail,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _showDetail) {
          _closeDetail();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: _showDetail
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.brandColor),
                  onPressed: _closeDetail,
                )
              : null,
          title: const Text(
            "Discover",
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gabarito',
            ),
          ),
          centerTitle: true,
          actions: const [
            Icon(Icons.info_outline, color: AppColors.brandColor, size: 28),
            SizedBox(width: 16),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/map_mock_up.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            const Positioned(
              top: 220,
              left: 160,
              child: Icon(
                Icons.location_on,
                color: AppColors.brandColor,
                size: 45,
              ),
            ),
            DraggableScrollableSheet(
              controller: _sheetController,
              initialChildSize: 0.4,
              minChildSize: 0.25,
              maxChildSize: 0.95,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    
                    itemCount: _showDetail ? 1 : 11, 
                    itemBuilder: (context, index) {
                      if (_showDetail) {
                        return _buildRestaurantDetailView(context, MockData.currentRestaurant);
                      }
                      if (index == 0) return _buildHeader();

                      
                      return InkWell(
                        onTap: _openDetail,
                        child: _buildRestaurantCard(MockData.currentRestaurant),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Search for restaurants, foods",
            hintStyle: const TextStyle(fontFamily: 'Gabarito'),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFilterButton(
              label: "Nearest",
              icon: Icons.swap_vert,
              onTap: () {},
            ),
            _buildFilterButton(
              label: "Filters",
              icon: Icons.tune,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  
  Widget _buildRestaurantDetailView(BuildContext context, Restaurant restaurant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: GestureDetector(
            onTap: _closeDetail,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurant.name, 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gabarito',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.brandColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: AppColors.brandColor, size: 18),
                  Text(
                    " ${restaurant.rating}", 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.brandColor,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
            const SizedBox(width: 4),
            Text(restaurant.location, style: const TextStyle(color: Colors.grey, fontFamily: 'Gabarito')), 
          ],
        ),
        const SizedBox(height: 16),
        Text(
          restaurant.description, 
          style: const TextStyle(color: Colors.black54, height: 1.5, fontSize: 15, fontFamily: 'Gabarito'),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildInfoChip(Icons.attach_money, restaurant.budgetLabel),
            const SizedBox(width: 12),
            _buildInfoChip(Icons.access_time, restaurant.workingHours),
            const Spacer(),
            const Icon(Icons.favorite_border, color: Colors.red, size: 28),
          ],
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RestaurantMenuPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text(
              "See The Menu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Gabarito',
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  
  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              restaurant.imageUrl, 
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Gabarito'),
                ),
                Text(
                  "Restaurant • ${restaurant.distance}", 
                  style: const TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'Gabarito'),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.brandColor, size: 16),
                    Text(
                      " ${restaurant.rating} (${restaurant.reviewCount})", 
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.info_outline, color: AppColors.brandColor),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Gabarito')),
          const SizedBox(width: 6),
          Icon(icon, size: 18, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 13, fontFamily: 'Gabarito')),
        ],
      ),
    );
  }
}