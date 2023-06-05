import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    print("login");
    final formKey = GlobalKey<FormState>();
    Get.lazyPut<LoginController>(() => LoginController(formKey));
  }
}
