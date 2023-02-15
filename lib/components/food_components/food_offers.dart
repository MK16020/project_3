import 'package:flutter/material.dart';
import 'package:project_3/components/styled_text.dart';

class FoodOffers extends StatelessWidget {
  const FoodOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/ed0dba148311139.Y3JvcCwyODQ3LDIyMjcsMCwxMzEx.jpg',
      'https://mir-s3-cdn-cf.behance.net/project_modules/fs/bbcfaf49315549.58b0c8b143b89.jpg',
      'https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/15e643148311905.Y3JvcCwzNjQ4LDI4NTMsMCwxMzA5.jpg',
    ];

    return SizedBox(
      height: 300,
      child: PageView(scrollDirection: Axis.horizontal, children: [
        for (int i = 0; i < 3; i++)
          Row(children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
                  width: 400,
                  height: 250,
                  margin: const EdgeInsets.all(16),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: NetworkImage(
                      images[i],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                  width: 400,
                  height: 250,
                  margin: const EdgeInsets.all(16),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      StyledText(
                        label: '\n\n \t\tThe Good Bowls \n\t\t limited offer',
                        size: 32,
                        color: Colors.white,
                      ),
                      StyledText(
                        label: '\tAll good things come in a bowl',
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      ]),
    );
  }
}
