class MenuModel {
  final int id, restaurantId;
  final String name, imageUrl, category;
  final double price;
  static List<MenuModel> menus = [];

  MenuModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.restaurantId,
  });
}
