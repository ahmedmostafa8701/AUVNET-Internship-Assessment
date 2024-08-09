import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/text_sizes.dart';

class SecondaryChoiceWidget extends StatelessWidget {
  SecondaryChoiceWidget({
    super.key,
    required this.question,
    required this.choice,
    required this.onPressed,
  });
  String question;
  String choice;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: secondaryColor,
            fontSize: heading3,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            choice,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: heading3,
            ),
          ),
        ),
      ],
    );
  }
}