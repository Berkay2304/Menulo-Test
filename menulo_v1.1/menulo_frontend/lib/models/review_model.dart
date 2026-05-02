class ReviewModel {
  final String id;
  final String userName;
  final String userProfileImage;
  final String comment;
  final int rating;
  final String date;

  ReviewModel({
    required this.id,
    required this.userName,
    required this.userProfileImage,
    required this.comment,
    required this.rating,
    this.date = "",
  });
}