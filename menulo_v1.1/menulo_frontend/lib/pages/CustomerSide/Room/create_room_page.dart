import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'room_page.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({super.key});

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  final TextEditingController _roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.brandColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Create New Room",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gabarito',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Room Name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gabarito',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _roomNameController,
              style: const TextStyle(fontFamily: 'Gabarito'),
              decoration: InputDecoration(
                hintText: "e.g. Dinner with Friends",
                hintStyle: const TextStyle(fontFamily: 'Gabarito'),
                filled: true,
                fillColor: const Color(0xFFF1F4F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Quick Privacy Settings",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gabarito',
              ),
            ),
            const SizedBox(height: 12),
            _buildToggleOption("Public Room", "Anyone with link can join", true),
            _buildToggleOption("Allow Multiple Votes", "Friends can pick multiple foods", false),
            
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RoomPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                ),
                child: const Text(
                  "Create and Get QR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOption(String title, String subtitle, bool isEnabled) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Gabarito',
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Gabarito',
          ),
        ),
        trailing: Switch(
          value: isEnabled,
          activeColor: AppColors.brandColor,
          onChanged: (val) {},
        ),
      ),
    );
  }
}