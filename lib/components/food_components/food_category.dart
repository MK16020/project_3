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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          CircleAvatar(
            backgroundImage: NetworkImage(category.imageUrl),
            radius: 30,
          ),
          StyledText(label: category.name, size: 12),
        ]),
      ]),
    );
  }
}
