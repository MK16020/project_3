import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/category_model.dart';
import 'package:project_3/models/restaurant_model.dart';
import 'package:project_3/pages/restaurant_page.dart';

import '../components/food_components/food_cuisine.dart';

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
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            title: StyledText(label: 'All Restaurants', size: 20),
          ),
          FoodCuisine(categories: CategoryModel.categories),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Column(
                  children: [
                    for (final restaurant in RestaurantModel.restaurant)
                      InkWell(
                        onTap: () {
                          Get.to(RestaurantPage(
                            restaurant: restaurant,
                          ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  width: double.infinity,
                                  height: 300,
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    restaurant.imageUrl,
                                  ),
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
                                    child:
                                        StyledText(label: '7 - RS off delivery price', size: 20, color: Colors.white),
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
                            StyledText(label: restaurant.name, size: 16),
                            StyledText(label: 'cuisine, cuisine type', size: 12),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
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
