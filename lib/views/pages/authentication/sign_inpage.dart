import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/views/pages/authentication/register_page.dart';
import 'package:quiz_app/views/pages/home/home_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => HomePage());
                },
                child: const Text('Login')),
            TextButton(
                onPressed: () {
                  Get.to(() => const RegisterPage());
                },
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
