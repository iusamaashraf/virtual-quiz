import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/loading_dialog.dart';
import 'package:quiz_app/views/pages/authentication/login_page.dart';
import 'package:quiz_app/views/pages/home/home_page.dart';

class AuthenticationController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  File? customerImage;
  // <<<<============================ create account ==================================>>>>>

  void signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      context}) async {
    Utils.showLoadingDialog(context,
        text: 'Wait your account is in processed ....');
    Map<String, dynamic> userInfo = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profileImage': '',
    };
    await auth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      firestore
          .collection("Users")
          .doc(value.user!.uid)
          .set(userInfo)
          .then((value) {
        Get.offAll(() => HomePage());
      });
    });
  }
  // <<<<============================ login account ==================================>>>>>

  void login({required String email, required String password, context}) async {
    Utils.showLoadingDialog(context, text: 'Loading ....');
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        Get.back();
        Get.offAll(() => HomePage());
      });
    } catch (e) {
      Get.back();
      Get.snackbar("Alert", e.toString().split("] ").last);
    }
  }

// <<<<============================ signOut account ==================================>>>>>
  void signOut() async {
    await auth.signOut().then((value) => Get.offAll(() => LoginPage()));
  }

  // <<<<============================ forgot account ==================================>>>>>
  void forgotPassword({required String email, context}) async {
    Utils.showLoadingDialog(context, text: 'Loading ....');
    try {
      await auth.sendPasswordResetEmail(email: email.trim()).then((value) {
        Get.snackbar('Link sent succcessfully',
            'Please check your email to reset password');
        Get.to(() => LoginPage());
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString().split("] ").last);
    }
  }
}
