import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
              title: Center(child: StyledText(label: 'User Name', size: 30)),
              subtitle: Center(child: StyledText(label: 'Location', size: 14)),
            ),
            const SizedBox(height: 100),
            StyledText(label: 'Personal', size: 24),
            const SizedBox(height: 20),
            StyledText(label: 'Orders', size: 16),
            const Divider(),
            StyledText(label: 'Addresses', size: 16),
            const Divider(),
            const SizedBox(height: 30),
            StyledText(label: 'General', size: 24),
            const SizedBox(height: 20),
            StyledText(label: 'Help', size: 16),
            const Divider(),
            const Spacer(),
            InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const StyledButton(label: 'Logout'),),
          ],
        ),
      ),
    );
  }
}
