import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/preview_controller.dart';

// ignore: must_be_immutable
class PreviewQuestionPage extends StatelessWidget {
  PreviewQuestionPage({Key? key}) : super(key: key);
  PreviewController previewController = Get.put(PreviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 300,
        width: 300,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: previewController.preview!.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Text(previewController.preview![index].correctOption!),
              ],
            );
          }),
        ),
      ),
    );
  }
}
