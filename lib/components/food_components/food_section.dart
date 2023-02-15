import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_3/pages/offers_page.dart';

import '../styled_text.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      'https://mir-s3-cdn-cf.behance.net/project_modules/fs/4ca3b691415309.5e314fc43cecd.jpg',
      'https://mir-s3-cdn-cf.behance.net/project_modules/fs/11cd1b92166683.5e443aea888fa.jpg',
      'https://mir-s3-cdn-cf.behance.net/project_modules/fs/57380f83769121.5d4714e5639b6.jpg',
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffb9dfc2),
      width: double.infinity,
      height: 350,
      child: Column(children: [
        ListTile(
          leading: StyledText(label: 'Healthy Offers', size: 28),
          trailing: InkWell(onTap: () {Get.to(OffersPage());}, child: StyledText(label: 'Show All', size: 16)),
        ),
        SizedBox(
          height: 250,
          child: PageView(children: [
            for (final option in options)
              Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        image: NetworkImage(option),
                        fit: BoxFit.cover,
                      )),
                  StyledText(label: 'Happy Healthy', size: 16),
                  StyledText(label: 'cuisine, cuisine type', size: 12),
                ],
              ),
          ]),
        ),
      ]),
    );
  }
}
