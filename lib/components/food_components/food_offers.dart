import 'package:flutter/material.dart';

class FoodOffers extends StatelessWidget {
  const FoodOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(scrollDirection: Axis.horizontal, children: [
        Row(children: [Container(color: Colors.amber, width: 150, height: 150)]),
      ]),
    );
  }
}
