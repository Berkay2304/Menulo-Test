import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';


import 'package:menulo/models/product_model.dart';
import 'package:menulo/models/review_model.dart';
import 'package:menulo/data/mock_data.dart';

class ProductReviewsPage extends StatelessWidget {
  
  final Product product;

  const ProductReviewsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    
    final List<ReviewModel> reviews = MockData.productReviews;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.2)),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleIcon(Icons.arrow_back, () => Navigator.pop(context)),
                      _buildCircleIcon(Icons.favorite_border, () {}),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 30,
                  right: 30,
                  child: _buildProductInfoCard(),
                ),
              ],
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Meal Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        product.rating.toString(), 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabarito',
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildReviewBadge(reviews.length),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: reviews.map((review) {
                  return _buildReviewTile(review);
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.brandColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Load more reviews...",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.brandColor,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildAddReviewField(),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.name, 
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gabarito',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.brandColor,
                    size: 16,
                  ),
                  Text(
                    " ${product.rating}", 
                    style: const TextStyle(
                      color: AppColors.brandColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gabarito',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                Text(
                  " Yener Kitchen", 
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description, 
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              height: 1.4,
              fontFamily: 'Gabarito',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "\$ ${product.price.toStringAsFixed(2)}", 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
                fontFamily: 'Gabarito',
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildReviewTile(ReviewModel review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(review.userProfileImage), 
            radius: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < review.rating ? Icons.star : Icons.star_border,
                          color: AppColors.brandColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  review.comment, 
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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

  Widget _buildAddReviewField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Review",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Gabarito',
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  
                  backgroundImage: AssetImage(MockData.currentUser.profileImageUrl),
                  radius: 25,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Comments",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Gabarito',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => Icon(
                                Icons.star_border,
                                color: Colors.grey.shade400,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.brandColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "SEND",
                              style: TextStyle(
                                color: AppColors.brandColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                fontFamily: 'Gabarito',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildReviewBadge(int reviewCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.brandColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        "$reviewCount+ reviews", 
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: 'Gabarito',
        ),
      ),
    );
  }
}