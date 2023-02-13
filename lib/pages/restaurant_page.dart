import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/restaurant_model.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RestaurantPage extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var minOrderPrice = restaurant.minOrderPrice.toString();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: StyledText(label: 'Large App Bar', size: 20),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
            flexibleSpace: Container(
              decoration: const BoxDecoration(),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Start a Group Order',
                        ),
                      ),
                      const SizedBox(height: 10),
                       TextField(
                        decoration: InputDecoration(
                          hintText: '$minOrderPrice- SAR Delivery (Above 40 SAR)',
                        ),
                      ),
                      const SizedBox(height: 20),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StyledText(label: restaurant.officialRating.toString(), size: 18),
                            const VerticalDivider(thickness: 1, color: Colors.black),
                            StyledText(label: restaurant.priceRange.toString(), size: 18),
                            const VerticalDivider(thickness: 1, color: Colors.black),
                            StyledText(label: '15', size: 18),
                            const VerticalDivider(thickness: 1, color: Colors.black),
                            StyledText(label: minOrderPrice, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: [
                      StickyHeader(
                        header: Container(
                          padding: const EdgeInsets.all(20),
                          child: StyledText(label: 'Section name', size: 24),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    color: Colors.white10,
                                    width: double.infinity,
                                    height: 500,
                                    child: Column(children: [
                                      ListTile(
                                        leading: IconButton(
                                          onPressed: () => Navigator.pop(context),
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                        ),
                                        title: StyledText(label: 'Customize', size: 20),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: ListTile(
                                              title: StyledText(label: 'Order Name', size: 16),
                                              subtitle: StyledText(label: 'Price', size: 12),
                                            ),
                                          ),
                                          Expanded(child: Container(color: Colors.blue, width: 90, height: 90)),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      StyledText(label: 'How Many?', size: 28),
                                      const SizedBox(height: 24),
                                      Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                                            StyledText(label: '1', size: 24),
                                            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      const StyledButton(label: 'Add to basket'),
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        StyledText(label: 'label', size: 16),
                                        StyledText(label: 'label', size: 16),
                                        StyledText(label: 'label', size: 16),
                                        StyledText(label: 'label', size: 16),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.amber,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
