import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';

import '../components/styled_text.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      border: const Border.fromBorderSide(BorderSide(width: 0.5)),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'Search location', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 28),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: StyledText(label: 'Detailed Location', size: 24),
                    subtitle: StyledText(label: 'simple location', size: 16),
                  ),
                  const SizedBox(height: 16),
                  const StyledButton(label: 'Confirm Location'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
