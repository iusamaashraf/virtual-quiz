import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/auth_controller.dart';
import 'package:quiz_app/views/widgets/imput_field.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class ForgotPage extends StatelessWidget with ValidationMixin {
  ForgotPage({Key? key}) : super(key: key);
  final TextEditingController mailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final AuthenticationController authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
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
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                InputField(
                  hintText: "helloworld@gmail.com",
                  controller: mailController,
                  vlaidator: (email) {
                    return isEmailValid(email!) ? null : 'Enter valid mail';
                  },
                ),
                SizedBox(height: size.height * 0.08),
                PrimaryButton(
                  size: size,
                  text: 'Submit',
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      authenticationController.forgotPassword(
                          email: mailController.text, context: context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
