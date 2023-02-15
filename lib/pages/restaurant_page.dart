import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/menu_model.dart';
import 'package:project_3/models/restaurant_model.dart';
import 'package:project_3/pages/basket_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantModel restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<MenuModel> menuList = [];
  int counter = 1;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('menu')
        .where('restaurant_Id', isEqualTo: widget.restaurant.id)
        .get()
        .then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final menuFromData = MenuModel.fromJson(data);
        menuList.add(menuFromData);
      }
      MenuModel.menu = menuList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var minOrderPrice = widget.restaurant.minOrderPrice.toString();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: Text(widget.restaurant.name, style: const TextStyle(fontSize: 30)),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.restaurant.imageUrl), fit: BoxFit.cover),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const TextField(decoration: InputDecoration(hintText: 'Start a Group Order')),
                    const SizedBox(height: 10),
                    TextField(decoration: InputDecoration(hintText: '$minOrderPrice- SAR Delivery (Above 40 SAR)')),
                    const SizedBox(height: 20),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StyledText(label: ' ${widget.restaurant.officialRating}\nRating', size: 18),
                          const VerticalDivider(thickness: 1, color: Colors.black),
                          StyledText(label: ' ${widget.restaurant.priceRange}\nprice', size: 18),
                          const VerticalDivider(thickness: 1, color: Colors.black),
                          StyledText(label: '15\ndelivery', size: 18),
                          const VerticalDivider(thickness: 1, color: Colors.black),
                          StyledText(label: '$minOrderPrice\nmin Order Price', size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView(children: [
                  StickyHeader(
                    header: Container(
                      padding: const EdgeInsets.all(20),
                      child: StyledText(label: 'Section name', size: 24),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        for (final menu in MenuModel.menu)
                          InkWell(
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
                                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Expanded(
                                          flex: 3,
                                          child: ListTile(
                                            title: StyledText(label: menu.name, size: 16),
                                            subtitle: StyledText(label: '${menu.price}', size: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 90,
                                            height: 90,
                                            margin: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Image(image: NetworkImage(menu.imageUrl)),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 24),
                                      StyledText(label: 'How Many?', size: 28),
                                      const SizedBox(height: 24),
                                      Container(
                                        color: Colors.white,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                          IconButton(
                                            onPressed: () {
                                              cart.remove(menu);
                                              counter = counter--;
                                              if (counter <= 0) {
                                                Get.back();
                                              }
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.remove_circle),
                                          ),
                                          StyledText(label: '$counter', size: 24),
                                          IconButton(
                                            onPressed: () {
                                              cart.add(menu);
                                              counter++;
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.add_circle),
                                          ),
                                        ]),
                                      ),
                                      const SizedBox(height: 30),
                                      InkWell(
                                        onTap: () {
                                          cart.add(menu);
                                          print(counter);
                                        },
                                        child: const StyledButton(label: 'Add to basket'),
                                      ),
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    StyledText(label: menu.name, size: 16),
                                    StyledText(label: '${menu.price}', size: 16),
                                    StyledText(label: menu.description, size: 16),
                                  ]),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image(image: NetworkImage(menu.imageUrl)),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                      ]),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        width: MediaQuery.of(context).size.width * 0.5,
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xff38b750),
          elevation: 0,
          onPressed: () {
            Get.to(BasketPage(cart: cart));
          },
          label: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text('${cart.length}'),
              ),
              const Text('Basket: SAR', style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
