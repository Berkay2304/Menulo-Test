import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/AdminSide/restaurant.dart';
import 'package:menulo/pages/Splash/splash_screen.dart';



class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  static const Color accentColor = Color(0xFFFFE082);

  

  void _updateStatus(int id, String newStatus) {
    setState(() {
      final index = restaurants.indexWhere((r) => r.id == id);
      if (index != -1) {
        restaurants[index].status = newStatus;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        title: const Text(
          'Menulo Administration',
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textDark),
            onPressed: () {},
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              offset: const Offset(0, 50),
              child: const CircleAvatar(
                backgroundColor: AppColors.brandColor,
                child: Text('A', style: TextStyle(color: Colors.white)),
              ),
              onSelected: (value) {
                if (value == 'logout') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SplashScreen();
                      },
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.redAccent, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Log Out',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Restaurants Waiting for Approve',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can approve or reject restaurants',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemCount: restaurants.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Owner: ${restaurant.ownerName}',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Chip(
                              label: Text(
                                restaurant.status,
                                style: TextStyle(
                                  color: _getStatusTextColor(restaurant.status),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: _getStatusColor(
                                restaurant.status,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: Color(0xFFF0F0F0)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Join: ${restaurant.joinDate}',
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 4),
                            Row(
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () =>
                                      _updateStatus(restaurant.id, 'Rejected'),
                                  icon: const Icon(Icons.close, size: 16),
                                  label: const Text('Reject'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      _updateStatus(restaurant.id, 'Approved'),
                                  icon: const Icon(Icons.check, size: 16),
                                  label: const Text('OK'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.brandColor,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return const Color(0xFFE8F5E9);
      case 'Rejected':
        return const Color(0xFFFFEBEE);
      default:
        return accentColor;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green.shade800;
      case 'Rejected':
        return Colors.red.shade800;
      default:
        return const Color(0xFF827717);
    }
  }
}
