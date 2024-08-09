import 'package:flutter/material.dart';

import '../../../../../core/presentation/responsive.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/text_sizes.dart';

class EmailInputField extends StatelessWidget {
  EmailInputField({
    super.key,
    this.hintText = 'Email',
    this.controller,
  });
  String hintText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.email,
            color: primaryColor,
            size: responsiveWidth(20),
          ),
          SizedBox(
            width: responsiveWidth(10),
          ),
          SizedBox(
            width: responsiveWidth(310),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
