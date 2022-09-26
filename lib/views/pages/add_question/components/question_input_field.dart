import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';

class QuestionInputField extends StatelessWidget {
  const QuestionInputField({
    Key? key,
    required this.size,
    required this.questionController,
  }) : super(key: key);

  final Size size;
  final TextEditingController questionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsClass.primaryColor),
      ),
      child: TextFormField(
        maxLines: 8,
        controller: questionController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: 'Enter question here.....',
          errorBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
