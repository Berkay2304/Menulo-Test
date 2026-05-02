import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/CustomerSide/Menu/restaurant_menu.dart';


import 'package:menulo/models/restaurant_model.dart';
import 'package:menulo/data/mock_data.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  
  
  late List<Restaurant> _favouriteRestaurants;

  @override
  void initState() {
    super.initState();
    _favouriteRestaurants = List.from(MockData.favouriteRestaurants);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Favourites",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gabarito',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Low To High", Icons.swap_vert),
                _buildFilterButton("Filters", Icons.tune),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: _favouriteRestaurants.length,
                itemBuilder: (context, index) {
                  
                  return _buildFavouriteCard(_favouriteRestaurants[index], index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildFavouriteCard(Restaurant restaurant, int index) {
    return Dismissible(
      key: Key("${restaurant.id}_$index"),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.only(right: 25),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.redAccent.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 30),
      ),
      onDismissed: (direction) {
        
        setState(() {
          _favouriteRestaurants.removeAt(index);
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantMenuPage(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(12),
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
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  restaurant.imageUrl, 
                  width: 85,
                  height: 85,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${restaurant.type} • ${restaurant.distance}", 
                      style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Gabarito'),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.brandColor, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(), 
                          style: const TextStyle(
                            fontSize: 13, 
                            fontWeight: FontWeight.bold,
                            color: AppColors.brandColor,
                            fontFamily: 'Gabarito',
                          ),
                        ),
                        Text(
                          " (${restaurant.reviewCount})", 
                          style: const TextStyle(
                            fontSize: 11, 
                            color: Colors.grey,
                            fontFamily: 'Gabarito',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(width: 6),
          Icon(icon, size: 16, color: Colors.black54),
        ],
      ),
    );
  }
}