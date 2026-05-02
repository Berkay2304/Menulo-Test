import '../models/restaurant_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../models/review_model.dart';

class MockData {
  static final List<String> categories = [
    "All", "Green Menu", "Chicken", "Burger", "Pizza", "Salads", "Drinks"
  ];

  static final Restaurant currentRestaurant = Restaurant(
    id: "1",
    name: "Yener Kitchen",
    rating: 4.5,
    reviewCount: 149,
    location: "Ataşehir, İstanbul",
    description: "Lorem ipsum dolor sit amet consectetur. Commodo ultrices dis suspendisse ornare est. Maecenas sit non feugiat.",
    budgetLabel: "Budget",
    workingHours: "09.00 - 22.00",
    type: "Restaurant",
    imageUrl: "assets/images/restaurant_mock_up.jpg",
    distance: "1.2 km away", 
  );

  static final List<Product> mockProducts = [
    Product(
      id: "p1",
      name: "Chicken Special",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas pulvinar tristique hac.",
      price: 289.90,
      rating: 4.5,
      imageUrl: "assets/images/food_mock.jpg",
      categoryId: "Chicken",
    ),
    Product(
      id: "p2",
      name: "Burger Special",
      description: "Lorem ipsum dolor sit amet, egestas pulvinar tristique hac.",
      price: 210.50,
      rating: 4.2,
      imageUrl: "assets/images/food_mock.jpg", 
      categoryId: "Burger",
    ),
  ];

  static final List<Restaurant> favouriteRestaurants = [
    Restaurant(
      id: "2",
      name: "Rosemary Lounge",
      type: "Bar/Pub",
      rating: 4.5,
      reviewCount: 86,
      location: "Ataşehir, İstanbul",
      description: "Harika bir lounge deneyimi.",
      budgetLabel: "Budget",
      workingHours: "10.00 - 02.00",
      imageUrl: "assets/images/restaurant_mock_up.jpg",
      distance: "1.2 km away",
    ),
    Restaurant(
      id: "3",
      name: "Tavuk Dünyası",
      type: "Restaurant",
      rating: 4.2,
      reviewCount: 112,
      location: "Kadıköy, İstanbul",
      description: "Lezzetli tavuk menüleri.",
      budgetLabel: "Mid-Range",
      workingHours: "10.00 - 22.00",
      imageUrl: "assets/images/restaurant_mock_up.jpg",
      distance: "0.3 km away",
    ),
  ];

  static final UserModel currentUser = UserModel(
    id: "u1",
    firstName: "Berkay",
    lastName: "Cansever",
    email: "berkay@example.com",
    profileImageUrl: "assets/images/profile_mock_up.png", // Mock resim
  );

  static final List<ReviewModel> productReviews = [
    ReviewModel(
      id: "r1",
      userName: "Maudie",
      userProfileImage: "assets/images/face_mock.png",
      comment: "Itaque dolor fuga natus eveniet.",
      rating: 5,
    ),
    ReviewModel(
      id: "r2",
      userName: "Davion",
      userProfileImage: "assets/images/face_mock.png",
      comment: "Laboriosam voluptatibus voluptatibus deserunt repellendus.",
      rating: 4,
    ),
  ];

  static final List<ReviewModel> restaurantReviews = [
    ReviewModel(
      id: "rr1",
      userName: "Maudie",
      userProfileImage: "assets/images/face_mock.png",
      comment: "Itaque dolor fuga natus eveniet.",
      rating: 5,
    ),
    ReviewModel(
      id: "rr2",
      userName: "Davion",
      userProfileImage: "assets/images/face_mock.png",
      comment: "Laboriosam voluptatibus voluptatibus deserunt repellendus.",
      rating: 4,
    ),
    ReviewModel(
      id: "rr3",
      userName: "Elara",
      userProfileImage: "assets/images/face_mock.png",
      comment: "Great atmosphere and delicious food!",
      rating: 5,
    ),
  ];
}