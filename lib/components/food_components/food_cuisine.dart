import 'package:flutter/material.dart';
import '../styled_text.dart';
import '../../models/category_model.dart';

class FoodCuisine extends StatelessWidget {
  const FoodCuisine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (final category in categories) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 1)),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: StyledText(label: category.name, size: 16),
          ),
          const SizedBox(width: 15),
        ],
      ]),
    );
  }
}
