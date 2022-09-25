import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Phone Number'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            TextButton(onPressed: () {}, child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
