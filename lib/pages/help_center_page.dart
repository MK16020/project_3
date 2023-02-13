import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            title: StyledText(label: 'Help center', size: 20),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: StyledText(
              label: 'Check out our quick help topics below or call us and we will help you solve your issue',
              size: 16,
            ),
          ),
          const SizedBox(height: 16),
          const StyledButton(label: 'Call Careem'),
          const ExpansionTile(
            title: Text('ExpansionTile 1'),
            textColor: Colors.black,
            children: <Widget>[
              ListTile(title: Text('This is tile number 1')),
              
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey[400],
    );
  }
}
