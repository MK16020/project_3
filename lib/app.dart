import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_3/pages/nav_bar.dart';

import 'models/category_model.dart';
import 'models/restaurant_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<CategoryModel> categoriesList = [];
  List<RestaurantModel> restaurantslist = [];
  @override
  void initState() {
    super.initState();
    restaurantMethod();

    categoryMethod();
  }

  void categoryMethod() {
    FirebaseFirestore.instance.collection('Category').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final categoryFromData = CategoryModel.fromJson(data);
        categoriesList.add(categoryFromData);
      }
      CategoryModel.categories = categoriesList;
      setState(() {});
    });
  }

  void restaurantMethod() {
    FirebaseFirestore.instance.collection('Restuarant').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final restaurantFromData = RestaurantModel.toRestaurant(data);

        restaurantslist.add(restaurantFromData);
      }
      RestaurantModel.restaurant = restaurantslist;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body: NavBar(),
      ),
      color: Color(0xfff5f5f5),
      debugShowCheckedModeBanner: false,
    );
  }
}
/*
StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return snapshot.hasData ? const NavBar() : const LoginPage();
          },
        ),
 */