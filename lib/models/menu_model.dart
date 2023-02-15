class MenuModel {
  final String id, name, imageUrl, description, restaurantId;
  final double price;
  static List<MenuModel> menu = [];

  MenuModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.restaurantId,
    required this.description,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        price: json['price'],
        restaurantId: json['restaurant_Id'],
        description: json['description'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image_url': imageUrl,
        'name': name,
        'price': price,
        'restaurant_Id': restaurantId,
        'description': description,
      };
}

List<MenuModel> cart = [];

