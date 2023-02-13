import 'package:flutter/material.dart';

import '../components/styled_text.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(
                label: 'Basket',
                size: 28,
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(label: 'Meal name', size: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                            StyledText(label: '1', size: 16),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
                          ],
                        ),
                        StyledText(label: 'Price', size: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(label: 'Promocode', size: 28),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 0.5)),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: StyledText(
                      label: 'THREE - 3 SAR for delivery (Above 40 SAR)',
                      size: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: 'Have a code? type it here'),
                  ),
                ],
              ),
              Column(
                children: [
                  StyledText(label: 'Give Donation ', size: 28),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 0.5)),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        margin: const EdgeInsets.all(15),
                        child: StyledText(
                          label: '5 SAR',
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
