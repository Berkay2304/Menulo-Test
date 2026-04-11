import 'package:flutter/material.dart';

class RestaurantReviewsOwnerPage extends StatefulWidget {
  const RestaurantReviewsOwnerPage({super.key});

  @override
  State<RestaurantReviewsOwnerPage> createState() => _RestaurantReviewsOwnerPageState();
}

class _RestaurantReviewsOwnerPageState extends State<RestaurantReviewsOwnerPage> {
  final Color primaryOrange = const Color(0xFFFFA63B);
  final Color softGrey = const Color(0xFFF1F4F8);
  final Color deleteRed = const Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Manage Reviews",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            _buildSummaryStats(),

            const SizedBox(height: 10),

            
            _buildFilterTabs(),

            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: 3, 
              itemBuilder: (context, index) {
                return _buildOwnerReviewCard(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryOrange.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("4.5", "Average Rating", Icons.star),
          Container(width: 1, height: 40, color: primaryOrange.withOpacity(0.2)),
          _buildStatItem("322", "Total Reviews", Icons.maps_ugc_rounded),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: primaryOrange, size: 18),
            const SizedBox(width: 5),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: ["All", "Latest", "Critical", "Replied"].map((tab) {
          bool isSelected = tab == "All";
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? primaryOrange : softGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOwnerReviewCard(int index) {
    
    final List<String> names = ["Maudie", "Davion", "Arda Akar"];
    final List<String> comments = [
      "Itaque dolor fuga natus eveniet. Yemekler harikaydı!",
      "Servis biraz yavaştı ama lezzet yerinde.",
      "Tavuk şiş efsane, mutlaka deneyin."
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
        border: Border.all(color: softGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: primaryOrange.withOpacity(0.2),
                child: Text(names[index][0], style: TextStyle(color: primaryOrange)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const Text("2 hours ago", style: TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
              _buildRatingStars(4),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            comments[index],
            style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _showReplyDialog(names[index]),
                  icon: Icon(Icons.reply, size: 16, color: primaryOrange),
                  label: Text("Reply", style: TextStyle(color: primaryOrange)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryOrange),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              
              IconButton(
                onPressed: () => _confirmDelete(),
                icon: Icon(Icons.delete_outline, color: deleteRed),
                style: IconButton.styleFrom(
                  backgroundColor: deleteRed.withOpacity(0.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: primaryOrange,
          size: 14,
        );
      }),
    );
  }

  void _showReplyDialog(String userName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reply to $userName", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Write your response...",
                filled: true,
                fillColor: softGrey,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryOrange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Send Reply", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Review?"),
        content: const Text("This action cannot be undone. Do you want to remove this review?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text("Delete", style: TextStyle(color: deleteRed)),
          ),
        ],
      ),
    );
  }
}