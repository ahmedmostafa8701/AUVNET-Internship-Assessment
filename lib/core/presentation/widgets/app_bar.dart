import 'package:auvnet_internship_assessment/styles/colors.dart';
import 'package:auvnet_internship_assessment/styles/text_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar buildAppBar(
      {required String title, List<Widget> actions = const []}) {
    return AppBar(
      actions: actions,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEDEDED),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: heading3,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
    );
  }
}
