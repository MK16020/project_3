class CategoryModel {
  final String id, imageUrl, name;
  static List<CategoryModel> categories = [];
  CategoryModel({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory CategoryModel.fromJson(
    Map<String, dynamic> map,
  ) =>
      CategoryModel(
        id: map['id'],
        imageUrl: map['image_url'],
        name: map['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image_url': imageUrl,
        'name': name,
      };
  
}
