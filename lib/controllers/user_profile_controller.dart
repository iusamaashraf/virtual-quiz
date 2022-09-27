import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/user_profile_model.dart';
import 'package:quiz_app/utils/loading_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfileController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Rxn<UserProfileModel> userModel = Rxn<UserProfileModel>();
  UserProfileModel? get user => userModel.value;
  File? profileImage;
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  // <<<<=========================== getting user profile data =======================>>>
  Future<void> getProfile() async {
    firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      userModel.value = UserProfileModel.fromSnapshot(value);
      return UserProfileModel.fromSnapshot(value);
    });
  }

// <<<<=========================== update profile =======================>>>
  void updateProfile({
    required String image,
    context,
  }) async {
    Utils.showLoadingDialog(context, text: 'Updating Please Wait ...');
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile-image')
        .child(auth.currentUser!.uid);
    await ref.putFile(profileImage!);
    final url = await ref.getDownloadURL();
    Map<String, dynamic> userInfo = {
      'profileImage': profileImage == null ? image : url,
    };
    await firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .update(userInfo);
    await getProfile().then((value) {
      Get.back();
    });
  }
}
