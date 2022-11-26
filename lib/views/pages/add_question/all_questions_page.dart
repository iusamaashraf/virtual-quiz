import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/add_subject_controller.dart';
import 'package:quiz_app/controllers/preview_controller.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/views/pages/create_quiz/create_quiz_page.dart';
import 'package:quiz_app/views/widgets/primary_appbar.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class AllQuestionsPage extends StatefulWidget {
  const AllQuestionsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<AllQuestionsPage> createState() => _AllQuestionsPageState();
}

class _AllQuestionsPageState extends State<AllQuestionsPage>
    with ValidationMixin {
  final AddSubjectController subjectController =
      Get.put(AddSubjectController());
  final PreviewController previewController = Get.put(PreviewController());
  @override
  void initState() {
    subjectController.getQuestionList(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PrimaryAppBar(text: "Questions Preview", actions: []),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GetX<AddSubjectController>(
              init: AddSubjectController(),
              builder: (controller) {
                return Column(
                  children: [
                    subjectController.question!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: subjectController.question!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width * 1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: ColorsClass.primaryColor,
                                            width: 0.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Checkbox(
                                                  value: subjectController
                                                      .question![index]
                                                      .isSelect,
                                                  onChanged: (onChanged) {
                                                    setState(() {
                                                      subjectController
                                                              .question![index]
                                                              .isSelect =
                                                          !subjectController
                                                              .question![index]
                                                              .isSelect!;

                                                      subjectController
                                                          .updateQuestion(
                                                        widget.id,
                                                        subjectController
                                                            .question![index]
                                                            .isSelect!,
                                                        subjectController
                                                            .question![index]
                                                            .id!,
                                                      );
                                                      // here we add selected quiz in list which is quiz model type
                                                      if (subjectController
                                                              .question![index]
                                                              .isSelect! ==
                                                          true) {
                                                        previewController.preview?.add(QuestionModel(
                                                            id: subjectController
                                                                .question![
                                                                    index]
                                                                .id,
                                                            question:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .question,
                                                            optionA:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionA,
                                                            optionB:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionB,
                                                            optionC:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionC,
                                                            optionD:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionD,
                                                            correctOption:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .correctOption,
                                                            isSelect:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .isSelect));
                                                      } else {
                                                        previewController.preview?.remove(QuestionModel(
                                                            id: subjectController
                                                                .question![
                                                                    index]
                                                                .id,
                                                            question:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .question,
                                                            optionA:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionA,
                                                            optionB:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionB,
                                                            optionC:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionC,
                                                            optionD:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .optionD,
                                                            correctOption:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .correctOption,
                                                            isSelect:
                                                                subjectController
                                                                    .question![
                                                                        index]
                                                                    .isSelect));
                                                      }
                                                      print(
                                                          "length is: ${previewController.preview!.length.toString()}");
                                                    });
                                                  }),
                                            ),
                                            Text(
                                                "Question: " +
                                                    subjectController
                                                        .question![index]
                                                        .question!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                            Text(
                                                "Option A: " +
                                                    subjectController
                                                        .question![index]
                                                        .optionA!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                            Text(
                                                "Option B: " +
                                                    subjectController
                                                        .question![index]
                                                        .optionB!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                            Text(
                                                "Option C: " +
                                                    subjectController
                                                        .question![index]
                                                        .optionC!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                            Text(
                                                "Option D: " +
                                                    subjectController
                                                        .question![index]
                                                        .optionD!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                            const Divider(),
                                            Text(
                                                "Correct Option: " +
                                                    subjectController
                                                        .question![index]
                                                        .correctOption!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.3),
                            child: const Center(
                              child: Text('Nothing to show'),
                            ),
                          ),
                    subjectController.question!.isNotEmpty
                        ? PrimaryButton(
                            size: size,
                            text: 'Preview Quiz',
                            onTap: () {
                              // Get.to(() => PreviewQuestionPage());
                            },
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      size: size,
                      text: ' Create Quiz ',
                      onTap: () {
                        Get.to(() => CreateQuizPage(id: widget.id));
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
