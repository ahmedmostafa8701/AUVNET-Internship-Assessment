import 'package:flutter/material.dart';

import '../../../../../core/presentation/responsive.dart';
import '../../../../../styles/colors.dart';

class PasswordInputField extends StatefulWidget {
  PasswordInputField({
    super.key,
    this.hintText = 'Password',
    this.controller,
  });

  String hintText;
  TextEditingController? controller;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isEmpty = true;

  bool isVisible = false;

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
            Icons.lock,
            color: primaryColor,
            size: responsiveWidth(20),
          ),
          SizedBox(
            width: responsiveWidth(10),
          ),
          SizedBox(
            width: responsiveWidth(265),
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  isEmpty = value.isEmpty;
                });
              },
              obscureText: !isVisible,
            ),
          ),
          isEmpty ? Container() : IconButton(
            onPressed: (){
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
