class Restaurant {
  final String id;
  final String name;
  final String type;
  final double rating;
  final int reviewCount;
  final String location;
  final String description;
  final String budgetLabel;
  final String workingHours;
  final String imageUrl;
  final String distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.description,
    required this.budgetLabel,
    required this.workingHours,
    required this.imageUrl,
    this.distance = "",
  });
}