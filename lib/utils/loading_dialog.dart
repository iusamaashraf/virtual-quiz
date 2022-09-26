import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';

class Utils {
  static Future showLoadingDialog(BuildContext context, {String? text}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              children: [
                const CircularProgressIndicator(
                    color: ColorsClass.primaryColor),
                const SizedBox(
                  width: 20,
                ),
                Text(text!)
              ],
            ),
          ),
        );
      },
    );
  }
}
