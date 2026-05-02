import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';


import 'package:menulo/models/restaurant_model.dart';
import 'package:menulo/models/review_model.dart';
import 'package:menulo/data/mock_data.dart';

class RestaurantReviewsOwnerPage extends StatefulWidget {
  
  final Restaurant restaurant;

  const RestaurantReviewsOwnerPage({super.key, required this.restaurant});

  @override
  State<RestaurantReviewsOwnerPage> createState() => _RestaurantReviewsOwnerPageState();
}

class _RestaurantReviewsOwnerPageState extends State<RestaurantReviewsOwnerPage> {
  final Color deleteRed = const Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    
    final List<ReviewModel> reviews = MockData.restaurantReviews;

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
          "Manage Reviews",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Gabarito',
          ),
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
              
              itemCount: reviews.length, 
              itemBuilder: (context, index) {
                
                return _buildOwnerReviewCard(reviews[index]);
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
        color: AppColors.brandColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          _buildStatItem(widget.restaurant.rating.toString(), "Average Rating", Icons.star),
          Container(
            width: 1,
            height: 40,
            color: AppColors.brandColor.withOpacity(0.2),
          ),
          
          _buildStatItem(widget.restaurant.reviewCount.toString(), "Total Reviews", Icons.maps_ugc_rounded),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: AppColors.brandColor,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gabarito',
              ),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontFamily: 'Gabarito',
          ),
        ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.brandColor : const Color(0xFFF1F4F8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
                fontFamily: 'Gabarito',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  
  Widget _buildOwnerReviewCard(ReviewModel review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
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
        border: Border.all(color: const Color(0xFFF1F4F8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
              CircleAvatar(
                backgroundImage: AssetImage(review.userProfileImage),
                backgroundColor: AppColors.brandColor.withOpacity(0.2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                    Text(
                      
                      review.date.isNotEmpty ? review.date : "Recently", 
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                  ],
                ),
              ),
              _buildRatingStars(review.rating), 
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.comment, 
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
              height: 1.4,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _showReplyDialog(review.userName), 
                  icon: const Icon(
                    Icons.reply,
                    size: 16,
                    color: AppColors.brandColor,
                  ),
                  label: const Text(
                    "Reply",
                    style: TextStyle(
                      color: AppColors.brandColor,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.brandColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => _confirmDelete(),
                icon: Icon(Icons.delete_outline, color: deleteRed),
                style: IconButton.styleFrom(
                  backgroundColor: deleteRed.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
          color: AppColors.brandColor,
          size: 14,
        );
      }),
    );
  }

  void _showReplyDialog(String userName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reply to $userName",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Gabarito',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              maxLines: 4,
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
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Send Reply",
                  style: TextStyle(
                    color: Colors.white,
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

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Delete Review?",
          style: TextStyle(fontFamily: 'Gabarito'),
        ),
        content: const Text(
          "This action cannot be undone. Do you want to remove this review?",
          style: TextStyle(fontFamily: 'Gabarito'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(fontFamily: 'Gabarito'),
            ),
          ),
          TextButton(
            onPressed: () {
              
              Navigator.pop(context);
            },
            child: Text(
              "Delete",
              style: TextStyle(color: deleteRed, fontFamily: 'Gabarito'),
            ),
          ),
        ],
      ),
    );
  }
}