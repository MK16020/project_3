import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/pages/Register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(children: [
          ListTile(
            leading: SizedBox(
              height: 600,
              child: Image.network(
                'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/v1503517826/pzbugv4lzp59ivgpccqr.png',
              ),
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ),
          const SizedBox(height: 50),
          StyledText(
            label: 'Your Time, Your day',
            size: 28,
            color: Colors.white,
          ),
          StyledText(
            label: 'Your Life',
            size: 28,
            color: Colors.white,
          ),
          StyledText(
            label: 'Welcome, please enter your info',
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(height: 300),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Email'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text('Enter password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    logIn();
                  },
                  child: const StyledButton(label: 'Login'),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(label: 'Don\'t have an account?', size: 12),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: StyledText(label: 'Register', size: 12, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      backgroundColor: const Color(0xff38b750),
    );
  }
}
