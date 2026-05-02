import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';


import 'package:menulo/models/restaurant_model.dart';
import 'package:menulo/data/mock_data.dart';

class MyBusinessPage extends StatefulWidget {
  const MyBusinessPage({super.key});

  @override
  State<MyBusinessPage> createState() => _MyBusinessPageState();
}

class _MyBusinessPageState extends State<MyBusinessPage> {
  
  late Restaurant _restaurant;

  
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    
    _restaurant = MockData.currentRestaurant;

    
    _nameController = TextEditingController(text: _restaurant.name);
    _locationController = TextEditingController(text: _restaurant.location);
    _descController = TextEditingController(text: _restaurant.description);
  }

  @override
  void dispose() {
    
    _nameController.dispose();
    _locationController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    List<String> hours = _restaurant.workingHours.split('-');
    String openHour = hours.isNotEmpty ? hours[0].trim() : "09.00";
    String closeHour = hours.length > 1 ? hours[1].trim() : "22.00";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_restaurant.imageUrl), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48),
                      const Text(
                        "My Business",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/', 
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("Business Name"),
                  _buildTextField(_nameController),

                  const SizedBox(height: 15),
                  _buildLabel("Location"),
                  _buildTextField(_locationController),

                  const SizedBox(height: 15),
                  _buildLabel("Description"),
                  _buildTextField(_descController, maxLines: 3),

                  const SizedBox(height: 15),
                  _buildLabel("Work Hours"),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTimeField(
                          "Open @ $openHour", 
                          Icons.access_time,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildTimeField(
                          "Close @ $closeHour", 
                          Icons.block_flipped,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
          fontFamily: 'Gabarito',
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Gabarito'),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.brandColor, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildTimeField(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontFamily: 'Gabarito',
            ),
          ),
          Icon(icon, size: 20, color: Colors.black45),
        ],
      ),
    );
  }
}