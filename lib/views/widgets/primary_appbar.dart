import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const PrimaryAppBar({
    Key? key,
    required this.text,
    required this.actions,
  }) : super(key: key);
  final String text;
  final List<Widget> actions;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        text,
        style: const TextStyle(color: ColorsClass.primaryColor),
      ),
      actions: actions,
    );
  }
}
