import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/auth_controller.dart';
import 'package:quiz_app/views/widgets/imput_field.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget with ValidationMixin {
  SignupPage({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  AuthenticationController authenticationController =
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InputField(
                    hintText: "First Name",
                    isObsure: false,
                    controller: firstNameController,
                    vlaidator: (firstName) {
                      return isFirstNameValid(firstName!)
                          ? null
                          : 'Enter your name';
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  InputField(
                    hintText: "Last Name",
                    isObsure: false,
                    controller: lastNameController,
                    vlaidator: (lastName) {
                      return isLastNameValid(lastName!)
                          ? null
                          : 'Enter your last name';
                    },
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
                    controller: passwordController,
                    vlaidator: (password) {
                      return isPasswordValid(password!)
                          ? null
                          : 'Enter correct password';
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  PrimaryButton(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        authenticationController.signUp(
                            email: emailController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            password: passwordController.text,
                            context: context);
                      }
                    },
                    text: 'Register',
                    size: size,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Already have an account? Login',
                          style: TextStyle(color: ColorsClass.primaryColor)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
