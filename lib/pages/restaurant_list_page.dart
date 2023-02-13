import 'package:flutter/material.dart';
import 'package:project_3/components/styled_text.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.white),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(Icons.arrow_back),
            ),
            title: StyledText(label: 'label', size: 20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 1)),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: StyledText(label: 'label', size: 16),
              ),
            ]),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: double.infinity,
                          height: 300,
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: StyledText(label: ' - RS off delivery price', size: 20, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Column(children: [
                              StyledText(label: '30 - 40', size: 18),
                              StyledText(label: 'mins', size: 16),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    StyledText(label: 'restaurant name', size: 16),
                    StyledText(label: 'Rating, price range, cuisine, cuisine type', size: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
