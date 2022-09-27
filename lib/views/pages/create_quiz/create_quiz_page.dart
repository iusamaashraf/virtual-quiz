import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/add_subject_controller.dart';
import 'package:quiz_app/views/pages/add_question/components/question_input_field.dart';
import 'package:quiz_app/views/widgets/imput_field.dart';
import 'package:quiz_app/views/widgets/primary_appbar.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

// ignore: must_be_immutable
class CreateQuizPage extends StatefulWidget {
  CreateQuizPage({Key? key, required this.id}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var id;
  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> with ValidationMixin {
  final TextEditingController questionController = TextEditingController();

  final TextEditingController optionAController = TextEditingController();

  final TextEditingController optionBController = TextEditingController();

  final TextEditingController optionCController = TextEditingController();

  final TextEditingController optionDController = TextEditingController();

  final TextEditingController correctOptionController = TextEditingController();

  final _key = GlobalKey<FormState>();
  final AddSubjectController subjectController =
      Get.put(AddSubjectController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PrimaryAppBar(text: 'Create Quiz', actions: []),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    QuestionInputField(
                        size: size, questionController: questionController),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Option A",
                        controller: optionAController,
                        vlaidator: (option) {
                          return isSubjectValid(option!)
                              ? null
                              : 'Enter Option';
                        }),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Option B",
                        controller: optionBController,
                        vlaidator: (option) {
                          return isSubjectValid(option!)
                              ? null
                              : 'Enter Option';
                        }),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Option C",
                        controller: optionCController,
                        vlaidator: (option) {
                          return isSubjectValid(option!)
                              ? null
                              : 'Enter Option';
                        }),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Option D",
                        controller: optionDController,
                        vlaidator: (option) {
                          return isSubjectValid(option!)
                              ? null
                              : 'Enter Option';
                        }),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Correct Option",
                        controller: correctOptionController,
                        vlaidator: (option) {
                          return isSubjectValid(option!)
                              ? null
                              : 'Enter Option';
                        }),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    PrimaryButton(
                        size: size,
                        text: 'Add Question',
                        onTap: () {
                          //  Utils.showLoadingDialog(context, text: 'Please wait');
                          print("id is:${widget.id}");
                          if (_key.currentState!.validate()) {
                            subjectController
                                    .doesQuestionsExist(questionController.text)
                                ? Get.snackbar("Aready Exist",
                                    "Question is already exists please try with another")
                                : subjectController.addQuestion(
                                    widget.id,
                                    questionController.text,
                                    optionAController.text,
                                    optionBController.text,
                                    optionCController.text,
                                    optionDController.text,
                                    correctOptionController.text);
                          }
                          // Get.back();
                          questionController.clear();
                          optionAController.clear();
                          optionBController.clear();
                          optionCController.clear();
                          optionDController.clear();
                          correctOptionController.clear();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
