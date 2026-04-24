import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/app_colors.dart';

class ToastUtils {
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.success,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.error,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showInfoToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
