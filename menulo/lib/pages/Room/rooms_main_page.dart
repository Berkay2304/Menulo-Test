import 'package:flutter/material.dart';
import 'package:menulo/pages/QR/qrscan_page.dart';
import 'package:menulo/pages/Room/create_room_page.dart';
import 'room_page.dart'; // Bir önceki oluşturduğumuz sayfa

class RoomsMainPage extends StatelessWidget {
  const RoomsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFFA63B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Rooms",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildActionButtons(context, primaryOrange),
            const SizedBox(height: 30),
            const Text(
              "Active Rooms",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildRoomCard(
                    context,
                    roomName: "Akşam Yemeği Ekibi",
                    roomId: "224587",
                    friendsCount: 3,
                    status: "Deciding...",
                  ),
                  _buildRoomCard(
                    context,
                    roomName: "Yeditepe Kampüs Tayfa",
                    roomId: "109283",
                    friendsCount: 5,
                    status: "Matching!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Yeni Oda Oluştur ve Odaya Katıl Butonları
  Widget _buildActionButtons(BuildContext context, Color primaryColor) {
    return Row(
      children: [
        Expanded(
          child: _actionButton(
            label: "Create Room",
            icon: Icons.add_box_rounded,
            color: primaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateRoomPage(),
                ), // Hedef değişti
              );
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _actionButton(
            label: "Join Room",
            icon: Icons.qr_code_scanner_rounded,
            color: const Color(0xFF626262),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScanPage()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Oda Listesi Elemanı (Bilet Görünümlü)
  Widget _buildRoomCard(
    BuildContext context, {
    required String roomName,
    required String roomId,
    required int friendsCount,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RoomPage()),
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              // Sol Turuncu Şerit
              Container(
                width: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFA63B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Oda Bilgileri
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "ID: #$roomId • $friendsCount Friends",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              // Durum Etiketi
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFFA63B).withOpacity(0.5),
                  ),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Color(0xFFFFA63B),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
