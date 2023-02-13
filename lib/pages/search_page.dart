import 'package:flutter/material.dart';

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
            fillColor: Colors.white12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xfff5f5f5),
      ),
    );
  }
}
