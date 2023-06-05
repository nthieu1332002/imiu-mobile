import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ultis/colors.dart';

class FullLoading {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
          child: const Center(child: CircularProgressIndicator()),
          onWillPop: () => Future.value(false)),
      barrierDismissible: false,
      barrierColor: primaryColor,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
