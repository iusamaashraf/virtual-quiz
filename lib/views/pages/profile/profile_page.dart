import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/controllers/auth_controller.dart';
import 'package:quiz_app/controllers/user_profile_controller.dart';
import 'package:quiz_app/views/widgets/primary_appbar.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  final UserProfileController profileController =
      Get.put(UserProfileController());

  Future<Image> convertFileToImage(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);
    Uint8List uint8list = base64.decode(imageAsString);
    var image = Image.memory(uint8list);
    setState(() {
      profileController.profileImage = image as File;
    });
    // print('MY image is $myImage');
    return image;
  }

  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);

      //  final imageTemporary = File(image!.path);
      setState(() {
        profileController.profileImage = File(image!.path);
        (File(image.path));
        print('The image is${((image.path))}');
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.image, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.camera);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        text: 'Profile',
        actions: [
          TextButton(
              onPressed: () {
                authenticationController.signOut();
              },
              child: const Text(
                'SignOut',
                style: TextStyle(color: ColorsClass.primaryColor),
              )),
        ],
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Obx(
            () => profileController.userModel.value != null
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showOptionDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileController
                                      .userModel.value!.profileImage !=
                                  ""
                              ? NetworkImage(profileController
                                  .userModel.value!.profileImage!)
                              : const NetworkImage(
                                  "https://cdn.techjuice.pk/wp-content/uploads/2015/02/wallpaper-for-facebook-profile-photo-1024x645.jpg"),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        profileController.userModel.value!.firstName! +
                            ' ' +
                            profileController.userModel.value!.lastName!,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        profileController.userModel.value!.email!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      PrimaryButton(
                          size: size,
                          text: "Update Profile",
                          onTap: () {
                            profileController.updateProfile(
                                context: context,
                                image: profileController
                                    .userModel.value!.profileImage!);
                          }),
                    ],
                  )
                : Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
          )),
    );
  }
}
