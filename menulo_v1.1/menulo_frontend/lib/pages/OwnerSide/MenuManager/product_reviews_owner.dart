import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';

class ProductReviewsOwnerPage extends StatefulWidget {
  const ProductReviewsOwnerPage({super.key});

  @override
  State<ProductReviewsOwnerPage> createState() => _ProductReviewsOwnerPageState();
}

class _ProductReviewsOwnerPageState extends State<ProductReviewsOwnerPage> {
  final Color deleteRed = const Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Meal Review Management",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Gabarito',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProductHeader(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.sort, size: 18),
                    label: const Text("Filter"),
                    style: TextButton.styleFrom(foregroundColor: AppColors.brandColor),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 2, 
              itemBuilder: (context, index) {
                return _buildMealReviewManagerCard(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/food_mock.jpg",
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chicken Special",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Gabarito',
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.brandColor, size: 14),
                    const Text(
                      " 4.5",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Gabarito'),
                    ),
                    const Text(
                      " (149 Reviews)",
                      style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Gabarito'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "\$ 289.90",
                  style: TextStyle(
                    color: AppColors.brandColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealReviewManagerCard(int index) {
    final List<String> userNames = ["Maudie", "Davion"];
    final List<String> userComments = [
      "Sos miktarı biraz azdı ama tavuklar çok iyi pişmişti.",
      "Porsiyon çok doyurucu, teşekkürler!"
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F4F8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.brandColor.withOpacity(0.1),
                    child: const Icon(Icons.person, color: AppColors.brandColor, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    userNames[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                ],
              ),
              _buildRatingSmall(index == 0 ? 4 : 5),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            userComments[index],
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 13,
              height: 1.4,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 15),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              TextButton.icon(
                onPressed: () => _replyModal(userNames[index]),
                icon: const Icon(Icons.chat_bubble_outline, size: 16),
                label: const Text("Reply", style: TextStyle(fontSize: 13, fontFamily: 'Gabarito')),
                style: TextButton.styleFrom(foregroundColor: Colors.blueGrey),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_sweep_outlined, color: deleteRed, size: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSmall(int score) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          i < score ? Icons.star : Icons.star_border,
          color: AppColors.brandColor,
          size: 12,
        ),
      ),
    );
  }

  void _replyModal(String user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Response user $user",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Gabarito',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              style: const TextStyle(fontFamily: 'Gabarito'),
              decoration: InputDecoration(
                hintText: "Write your response...",
                hintStyle: const TextStyle(fontFamily: 'Gabarito'),
                filled: true,
                fillColor: const Color(0xFFF1F4F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Reply",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}