import 'package:flutter/material.dart';

import '../../../../../core/presentation/responsive.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/text_sizes.dart';
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    required this.text
  });
  void Function()? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: responsiveHeight(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: heading3,
          ),
        ),
      ),
    );
  }
}