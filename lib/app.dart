import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_3/pages/login_page.dart';
import 'package:project_3/pages/nav_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return snapshot.hasData ? const NavBar() : const LoginPage();
          },
        ),
      ),
      color: const Color(0xfff5f5f5),
      debugShowCheckedModeBanner: false,
    );
  }
}
