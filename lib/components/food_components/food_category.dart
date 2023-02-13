import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../styled_text.dart';

class FoodCategory extends StatelessWidget {
  final CategoryModel category;
  const FoodCategory({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
           CircleAvatar(
            backgroundImage: NetworkImage(category.image_url),
            radius: 30,
          ),
          StyledText(label: category.name, size: 12),
        ]),
      ]),
    );
  }
}
