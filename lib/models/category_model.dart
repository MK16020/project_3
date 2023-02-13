class CategoryModel {
  final String id, image_url, name; 
  
  CategoryModel({
    required this.id,
    required this.image_url,
    required this.name,
  });
  
}
List<CategoryModel> categories = [];