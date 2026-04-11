import 'package:flutter/material.dart';

class MenuManagerPage extends StatefulWidget {
  const MenuManagerPage({super.key});

  @override
  State<MenuManagerPage> createState() => _MenuManagerPageState();
}

class _MenuManagerPageState extends State<MenuManagerPage> {
  int _selectedCategoryIndex = 2; // Başlangıçta 'Chicken' seçili
  final Color primaryOrange = const Color(0xFFFFA63B);
  final Color softGrey = const Color(0xFFF1F4F8);

  final List<String> _categories = [
    "All",
    "Green Menu",
    "Chicken",
    "Burger",
    "Pizza",
    "Salads",
    "Drinks",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Section (Geri ve Paylaş Butonları Kaldırıldı)
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/restaurant_mock_up.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.35)),
                ),
                const Positioned(
                  top: 55,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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

            // 2. Categories Header & Add Item Button (Alternatif 2)
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
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Buraya Yeni Ürün Ekleme Mantığı Gelecek
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: primaryOrange.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_square,
                            size: 18,
                            color: primaryOrange,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Edit Menu",
                            style: TextStyle(
                              color: primaryOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            _buildCategoryList(),

            // 3. Grid Menu Area (Mat Tasarım)
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: softGrey,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.76,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => _buildManagerFoodCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Yardımcı Widgetlar ---

  Widget _buildBusinessInfoCard() {
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
              const Text(
                "Yener Kitchen",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              _buildRatingBadge(),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              Text(
                " Ataşehir, İstanbul",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Lorem ipsum dolor sit amet consectetur. Commodo ultrices dis suspendisse ornare est.",
            style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.3),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildSmallChip(Icons.attach_money, "Budget"),
              const SizedBox(width: 10),
              _buildSmallChip(Icons.access_time, "09.00 - 22.00"),
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
                      color: isSelected ? primaryOrange : Colors.grey.shade400,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2.5,
                      width: 20,
                      decoration: BoxDecoration(
                        color: primaryOrange,
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

  Widget _buildManagerFoodCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(
                "assets/images/food_mock.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chicken",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Text(
                  "Lorem ipsum egestas...",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 289.90",
                      style: TextStyle(
                        color: primaryOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    _buildEditButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryOrange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.edit, color: Colors.white, size: 10),
          const SizedBox(width: 4),
          Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.orange, size: 12),
          Text(
            " 4.5",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
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
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
