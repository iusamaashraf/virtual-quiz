// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quiz_app/controllers/auth_controller.dart';
// import 'package:quiz_app/controllers/user_profile_controller.dart';
// import 'package:quiz_app/views/pages/authentication/login_page.dart';
// import 'package:quiz_app/views/pages/home/home_page.dart';

// class RootAdmin extends StatelessWidget {
//   RootAdmin({Key? key}) : super(key: key);
//   UserProfileController authenticationController =
//       Get.put(UserProfileController());
//   @override
//   Widget build(BuildContext context) {
//     return GetX<AuthenticationController>(
//       initState: (_) {
//         Get.put<AuthenticationController>(AuthenticationController());
//       },
//       builder: ((controller) {
//         if (Get.find<UserProfileController>().user != null) {
//           return HomePage();
//         } else {
//           return LoginPage();
//         }
//       }),
//     );
//   }
// }
