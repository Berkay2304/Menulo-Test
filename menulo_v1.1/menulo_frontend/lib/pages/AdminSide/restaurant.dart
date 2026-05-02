class Restaurant {
  final int id;
  final String name;
  final String ownerName;
  final String joinDate;
  String status;

  Restaurant({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.joinDate,
    required this.status,
  });
}

List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Gurme Burger',
      ownerName: 'Ahmet Y.',
      joinDate: '12 Eyl 2023',
      status: 'Pending',
    ),
    Restaurant(
      id: 2,
      name: 'Kahve Durağı',
      ownerName: 'Ayşe K.',
      joinDate: '15 Eyl 2023',
      status: 'Pending',
    ),
    Restaurant(
      id: 3,
      name: 'Pizza Port',
      ownerName: 'Mehmet A.',
      joinDate: '10 Eyl 2023',
      status: 'Approved',
    ),
    Restaurant(
      id: 4,
      name: 'Tadım Restoran',
      ownerName: 'Zeynep D.',
      joinDate: '18 Eyl 2023',
      status: 'Rejected',
    ),
  ];