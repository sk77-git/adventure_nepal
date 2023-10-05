import 'package:flutter/material.dart';
import 'package:get/get.dart';

///This class is used to show show custom snackbar messages
class SnackBarUtil {
  static void showSnackBar(
          {required String message, Color? bgColor, IconData? leadingIcon}) =>
      /*Get.showSnackbar(
        GetSnackBar(
          onTap: (value) {
            Get.back();
          },
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 2000),
          message: message ?? "Message",
          messageText: Text(message),
          animationDuration: const Duration(milliseconds: 600),
          isDismissible: true,
          shouldIconPulse: false,
          dismissDirection: DismissDirection.endToStart,
          icon: Icon(
            leadingIcon,
            color: Colors.white,
          ),
          backgroundColor: bgColor ?? Colors.white,
        ),
      );*/
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
}
