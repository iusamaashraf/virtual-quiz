import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/add_subject_controller.dart';
import 'package:quiz_app/controllers/preview_controller.dart';
import 'package:quiz_app/views/pages/create_quiz/create_quiz_page.dart';
import 'package:quiz_app/views/pages/preview_question/preview_question_page.dart';
import 'package:quiz_app/views/widgets/primary_appbar.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class QuestionPreviewPage extends StatefulWidget {
  const QuestionPreviewPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<QuestionPreviewPage> createState() => _QuestionPreviewPageState();
}

class _QuestionPreviewPageState extends State<QuestionPreviewPage>
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
                                                                  .question![
                                                                      index]
                                                                  .isSelect!,
                                                              subjectController
                                                                  .question![
                                                                      index]
                                                                  .id!);

                                                      subjectController
                                                              .question![index]
                                                              .isSelect!
                                                          ? previewController
                                                              .questionList
                                                              .add(subjectController
                                                                      .question![
                                                                  index])
                                                          : SizedBox();
                                                      print(
                                                          'Sorted Questionlist is${previewController.questionList.length}');
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
                              Get.to(() => PreviewQuestionPage());
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
