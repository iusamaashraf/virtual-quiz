import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/auth_controller.dart';
import 'package:quiz_app/views/pages/authentication/forgot_page.dart';
import 'package:quiz_app/views/pages/authentication/sign_up_page.dart';
import 'package:quiz_app/views/widgets/imput_field.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class LoginPage extends StatelessWidget with ValidationMixin {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Container(
                    height: size.height * 0.4,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 12)
                        ]),
                    child: const Icon(
                      Icons.school,
                      size: 80,
                      color: ColorsClass.primaryColor,
                    ),
                  ),
                  // AppLogo(size: size),
                  // SizedBox(height: size.height * 0.02),
                  Text(
                    "Digital Education",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InputField(
                    hintText: "Email",
                    isObsure: false,
                    controller: emailController,
                    vlaidator: (email) {
                      return isEmailValid(email!) ? null : 'Enter valid email';
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  InputField(
                    hintText: "Password",
                    isObsure: true,
                    controller: passController,
                    vlaidator: (password) {
                      return isPasswordValid(password!)
                          ? null
                          : 'Enter correct password';
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPage());
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: ColorsClass.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  PrimaryButton(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        authenticationController.login(
                            email: emailController.text,
                            context: context,
                            password: passController.text);
                      }
                    },
                    text: 'Login',
                    size: size,
                  ),
                  Align(
                    // alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => SignupPage());
                      },
                      child: const Text(
                        'Don\'t have an account? Signup',
                        style: TextStyle(color: ColorsClass.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
