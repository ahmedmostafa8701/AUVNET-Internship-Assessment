import 'package:auvnet_internship_assessment/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class HelperFunctions {
  static void showCustomToast(
      {required BuildContext? context,
      required Text title,
      required ToastificationType type,
      required Widget? icon,
      required backgroundColor}) {
    toastification.show(
      context: context,
      alignment: Alignment.bottomCenter,
      backgroundColor: backgroundColor,
      icon: icon,
      title: title,
      autoCloseDuration: Duration(seconds: 3),
      dragToClose: true,
      type: type,
    );
  }

  static void showSuccessToast(
      {required BuildContext? context, required Text title}) {
    showCustomToast(
      context: context,
      title: title,
      type: ToastificationType.success,
      icon: Icon(
        Icons.check_circle_outline_rounded,
        color: primaryColor,
      ),
      backgroundColor: Colors.green,
    );
  }
  static void showErrorToast(
      {required BuildContext? context, required Text title}) {
    showCustomToast(
      context: context,
      title: title,
      type: ToastificationType.error,
      icon: Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
  }
}
