class RestaurantModel {
  final int minOrderPrice;
  final String name, imageUrl, logoUrl, id, categoryID, subCategory;
  final double officialRating, priceRange;
  static List<RestaurantModel> restaurant = [];

  RestaurantModel({
    required this.id,
    required this.minOrderPrice,
    required this.categoryID,
    required this.subCategory,
    required this.name,
    required this.officialRating,
    required this.priceRange,
    required this.imageUrl,
    required this.logoUrl,
  });

  factory RestaurantModel.toRestaurant(Map<String, dynamic> json) => RestaurantModel(
        id: json['id'],
        minOrderPrice: json['min_order_price'],
        categoryID: json['category_id'],
        subCategory: json['sub_category'],
        name: json['name'],
        officialRating: json['official_rating'],
        priceRange: json['price_rang'],
        imageUrl: json['image_url'],
        logoUrl: json['logo_url'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'minOrderPrice': minOrderPrice,
        'categoryID': categoryID,
        'subCategory': subCategory,
        'officialRating': officialRating,
        'priceRange': priceRange,
        'imageUrl': imageUrl,
        'logoUrl': logoUrl,

      };
}
