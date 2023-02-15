import 'package:flutter/material.dart';
import 'package:project_3/models/menu_model.dart';

import '../components/styled_text.dart';

class BasketPage extends StatelessWidget {
  final List<MenuModel> cart;
  const BasketPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    List<int> donation = [5, 10, 15, 20];
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
              for (final cart in cart)
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(label: cart.name, size: 16),
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
                          StyledText(label: '${cart.price}', size: 16),
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
                      for (final amount in donation)
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.grey, width: 0.5)),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          margin: const EdgeInsets.all(15),
                          child: StyledText(
                            label: '$amount SAR',
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  StyledText(label: 'Payment Summary', size: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledText(label: 'Basket Total inc Tax', size: 20),
                      StyledText(label: ' SAR', size: 20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledText(label: 'Delivery Fees', size: 20),
                      StyledText(label: ' SAR', size: 20),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledText(label: 'Order Total', size: 20),
                      StyledText(label: ' SAR', size: 20),
                    ],
                  ),
                  StyledText(label: 'Once Place you can\'t cancel the order or get a refund', size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
