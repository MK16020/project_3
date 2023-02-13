import 'package:flutter/material.dart';

import '../styled_text.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffb9dfc2),
      width: double.infinity,
      height: 300,
      child: Column(children: [
        ListTile(
          leading: StyledText(label: 'Healthy Offers', size: 28),
          trailing: InkWell(onTap: () {}, child: StyledText(label: 'Show All', size: 16)),
        ),
        SizedBox(height: 180, child: PageView(children: [Container(color: Colors.amber)])),
      ]),
    );
  }
}