import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/mixin_validator.dart';
import 'package:quiz_app/controllers/add_subject_controller.dart';
import 'package:quiz_app/views/widgets/imput_field.dart';
import 'package:quiz_app/views/widgets/primary_appbar.dart';
import 'package:quiz_app/views/widgets/primary_button.dart';

class AddSubjectPage extends StatelessWidget with ValidationMixin {
  AddSubjectPage({Key? key}) : super(key: key);
  final TextEditingController subjectController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final AddSubjectController addSubjectctrl = Get.put(AddSubjectController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PrimaryAppBar(
        text: 'Add Subject',
        actions: [],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text(
                "Plase add subjet name to proceed next",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorsClass.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: InputField(
                  hintText: 'Add Subject',
                  controller: subjectController,
                  vlaidator: (subjectName) {
                    return isSubjectValid(subjectName!)
                        ? null
                        : "Enter subject to proceed";
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              PrimaryButton(
                size: size,
                text: 'Add Subject',
                onTap: () {
                  if (_key.currentState!.validate()) {
                    addSubjectctrl.addSubject(
                      subjectController.text,
                      context,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
