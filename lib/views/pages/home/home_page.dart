import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/controllers/add_subject_controller.dart';
import 'package:quiz_app/controllers/user_profile_controller.dart';
import 'package:quiz_app/views/pages/add_question/question_preview_page.dart';
import 'package:quiz_app/views/pages/add_subject/add_subject_page.dart';
import 'package:quiz_app/views/pages/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final UserProfileController profileController =
      Get.put(UserProfileController());
  final AddSubjectController subjectController =
      Get.put(AddSubjectController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        height: size.height * 0.05,
        width: size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsClass.primaryColor),
        child: FloatingActionButton(
          backgroundColor: ColorsClass.primaryColor,
          onPressed: () {
            Get.to(() => AddSubjectPage());
          },
          child: const Text(
            'Add Subject',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: profileController.userModel.value != null
            ? Obx(
                () => Text(
                    "${profileController.userModel.value!.firstName}'s Dashboard",
                    style: const TextStyle(color: Colors.black)),
              )
            : const SizedBox(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: '',
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfilePage());
                },
                child: profileController.userModel.value != null
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage: profileController
                                    .userModel.value!.profileImage !=
                                ""
                            ? NetworkImage(profileController
                                .userModel.value!.profileImage!)
                            : const NetworkImage(
                                "https://cdn.techjuice.pk/wp-content/uploads/2015/02/wallpaper-for-facebook-profile-photo-1024x645.jpg"),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
      body: profileController.userModel.value != null
          ? GetX<UserProfileController>(
              init: UserProfileController(),
              builder: (controller) {
                return SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: subjectController.subject!.length,
                          itemBuilder: (context, index) {
                            var index1 = index + 1;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        Get.to(() => QuestionPreviewPage(
                                              id: subjectController
                                                  .subject![index].id!,
                                            )),
                                    child: Container(
                                      width: size.width * 0.9,
                                      decoration: BoxDecoration(
                                          color: ColorsClass.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Subject Number: $index1',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    subjectController
                                                        .subject![index]
                                                        .subjectName!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            color:
                                                                Colors.white)),
                                                Icon(
                                                  Icons.adaptive.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
