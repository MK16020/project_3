import 'package:flutter/material.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/models/category_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cancel),
        title: const TextField(
          decoration: InputDecoration(
            label: Icon(Icons.search, color: Colors.grey),
            fillColor: Color.fromARGB(31, 84, 80, 80),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xfff5f5f5),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final category in CategoryModel.categories) ...[
            InkWell(
              child: StyledText(label: category.name, size: 20),
            ),
            const SizedBox(height: 15),
          ],
        ],
      ),
    );
  }
}
