
import 'package:flutter/material.dart';

import '../styled_text.dart';

class RestaurantIcons extends StatelessWidget {
  const RestaurantIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 1)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 90,
            height: 90,
            child: StyledText(label: 'label', size: 16),
          ),
        ]),
      ),
    );
  }
}