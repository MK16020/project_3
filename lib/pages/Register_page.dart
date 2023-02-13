import 'package:flutter/material.dart';
import 'package:project_3/components/styled_button.dart';
import 'package:project_3/components/styled_text.dart';
import 'package:project_3/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          const Spacer(),
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
                DropdownButtonFormField<String>(
                  items: <String>['AlRiyadh', 'AlKhobar', 'Jeddah', 'Alhassa', 'AlQassim']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                  onChanged: (Object? value) {},
                  decoration: InputDecoration(
                    hintText: 'Choose Your City',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Enter your Name'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Enter your phone number'),
                    prefix: Text('+966'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Enter your Email'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Enter password'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {},
                  child: const StyledButton(label: 'Register'),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(label: 'Already registered?', size: 12),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: StyledText(label: 'Login', size: 12, color: Colors.blue),
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
