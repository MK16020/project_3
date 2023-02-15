import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/category_model.dart';
import 'package:project_3/pages/offers_page.dart';
import 'package:project_3/pages/restaurant_list_page.dart';
import 'package:searchfield/searchfield.dart';

import '../components/food_components/food_category.dart';
import '../components/food_components/food_cuisine.dart';
import '../components/food_components/food_offers.dart';
import '../components/food_components/food_section.dart';
import '../components/food_components/restaurant_icons.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: StyledText(label: 'Delivers to place', size: 20, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
          color: Colors.white,
          height: 600,
          child: Column(children: [
            SearchField(
              suggestions: ['American', 'Mexican', 'Asian', 'Arabian'].map((e) => SearchFieldListItem(e)).toList(),
              searchInputDecoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FoodCuisine(categories: CategoryModel.categories),
            InkWell(
              onTap: () {
                Get.to(const OffersPage());
              },
              child: const FoodOffers(),
            ),
            Row(
              children: [
                for (final category in CategoryModel.categories)
                  FoodCategory(
                    category: category,
                  ),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ),
        const FoodSection(),
        const SizedBox(height: 12),
        const RestaurantIcons(),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            Get.to(const RestaurantListPage());
          },
          child: StyledText(label: 'Show All', size: 30),
        ),
      ]),
      backgroundColor: const Color(0xfff5f5f5),
    );
  }
}
