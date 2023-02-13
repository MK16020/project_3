import 'package:flutter/material.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/category_model.dart';
import 'package:searchfield/searchfield.dart';

import '../components/food_components/food_category.dart';
import '../components/food_components/food_cuisine.dart';
import '../components/food_components/food_offers.dart';
import '../components/food_components/food_section.dart';
import '../components/food_components/restaurant_icons.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

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
          height: 450,
          child: Column(children: [
            SearchField(
              suggestions: ['abc', 'def', 'ghi', 'jkl'].map((e) => SearchFieldListItem(e)).toList(),
              searchInputDecoration:
                  const InputDecoration(suffixIcon: Icon(Icons.search), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            const FoodCuisine(),
            const FoodOffers(),
            for (final category in categories)
              FoodCategory(
                category: category,
              ),
            const SizedBox(height: 20),
          ]),
        ),
        const FoodSection(),
        const SizedBox(height: 12),
        const RestaurantIcons(),
      ]),
      backgroundColor: const Color(0xfff5f5f5),
    );
  }
}
