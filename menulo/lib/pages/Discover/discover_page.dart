import 'package:flutter/material.dart';
import 'package:menulo/pages/Menu/restaurant_menu.dart';

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
    final primaryColor = Theme.of(context).primaryColor;

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
                  icon: Icon(Icons.arrow_back_ios_new, color: primaryColor),
                  onPressed: _closeDetail,
                )
              : null,
          title: const Text("Discover", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            Icon(Icons.info_outline, color: primaryColor, size: 28),
            const SizedBox(width: 10),
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
            Positioned(
              top: 220,
              left: 160,
              child: Icon(Icons.location_on, color: primaryColor, size: 45),
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
                    itemCount: _showDetail ? 1 : 10,
                    itemBuilder: (context, index) {
                      if (_showDetail) {
                        return _buildRestaurantDetailView(primaryColor);
                      }
                      if (index == 0) return _buildHeader();

                      return InkWell(
                        onTap: _openDetail,
                        child: _buildRestaurantCard(primaryColor),
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

  Widget _buildRestaurantDetailView(Color primaryColor) {
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
            const Text(
              "Yener Kitchen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 18),
                  Text(
                    " 4.5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
            SizedBox(width: 4),
            Text("Ataşehir, İstanbul", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Lorem ipsum dolor sit amet consectetur. Commodo ultrices dis suspendisse ornare est. Maecenas sit non feugiat.",
          style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 15),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildInfoChip(Icons.attach_money, "Budget"),
            const SizedBox(width: 12),
            _buildInfoChip(Icons.access_time, "09.00 - 22.00"),
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
              backgroundColor: primaryColor,
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
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildRestaurantCard(Color primaryColor) {
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
              "assets/images/restaurant_mock_up.jpg",
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
                const Text(
                  "Rosemary Lounge",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "Bar/Pub • 1.2 km away",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: primaryColor, size: 16),
                    const Text(
                      " 4.5 (86)",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.info_outline, color: primaryColor),
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
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
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
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
