import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showSuccess(BuildContext context, String message) {
    _showToast(context, message, Colors.green, Icons.check);
  }

  static void showError(BuildContext context, String message) {
    _showToast(context, message, Colors.red, Icons.error_outline);
  }

  static void _showToast(
      BuildContext context, String message, Color color, IconData icon) {
    final toast = FToast();
    toast.init(context);

    toast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 12.0),
            Text(message, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
