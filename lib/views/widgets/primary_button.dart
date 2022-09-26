import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.size,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsClass.primaryColor),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: size.width * 0.3, vertical: size.height * 0.02))),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
