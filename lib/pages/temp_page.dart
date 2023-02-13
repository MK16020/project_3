import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/models/restaurant_model.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  TextEditingController categoryID = TextEditingController();
  TextEditingController ID = TextEditingController();
  TextEditingController imageURL = TextEditingController();
  TextEditingController minOrderPrice = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController officialRating = TextEditingController();
  TextEditingController priceRange = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController logoUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: categoryID,
              decoration: const InputDecoration(hintText: 'categoryID'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ID,
              decoration: const InputDecoration(hintText: 'ID'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: imageURL,
              decoration: const InputDecoration(hintText: 'imageURL'),
            ),
            TextField(
              controller: logoUrl,
              decoration: const InputDecoration(hintText: 'logoUrl'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: minOrderPrice,
              decoration: const InputDecoration(hintText: 'minOrderPrice'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: officialRating,
              decoration: const InputDecoration(hintText: 'officialRating'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceRange,
              decoration: const InputDecoration(hintText: 'priceRange'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: subCategory,
              decoration: const InputDecoration(hintText: 'subCategory'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: lat,
              decoration: const InputDecoration(hintText: 'lat'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: long,
              decoration: const InputDecoration(hintText: 'long'),
            ),
            InkWell(
              onTap: () {
                final RestaurantModel res = RestaurantModel(
                  id: ID.text,
                  minOrderPrice: int.parse(minOrderPrice.text),
                  lat: double.parse(lat.text),
                  long: double.parse(long.text),
                  categoryID: categoryID.text,
                  subCategory: subCategory.text,
                  name: name.text,
                  officialRating: double.parse(officialRating.text),
                  priceRange: double.parse(priceRange.text),
                  imageUrl: imageURL.text,
                  logoUrl: logoUrl.text,
                );
                Future createRestaurant() async {
                  final restaurant = FirebaseFirestore.instance.collection('Restaurant').doc(ID.text);
                  await restaurant.set(res.toMap());
                }

                setState(() {});
              },
              child: const StyledButton(label: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
