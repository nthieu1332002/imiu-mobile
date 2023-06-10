import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/apis/auth_api.dart';
import 'package:imiu_mobile/controllers/login_controller.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_toast.dart';
import 'package:imiu_mobile/widgets/full_loading.dart';

class RegisterController extends GetxController {
  final AuthApi authApi = AuthApi();
  late TextEditingController emailController, passwordController;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    print("registerFormKey: $registerFormKey");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    print("email value $value");
    if (value.isEmpty) {
      return 'Vui lòng nhập email.';
    } else if (!GetUtils.isEmail(value)) {
      return "Email không đúng định dạng.";
    }
    return null;
  }

  String? validatePassword(String value) {
    print("password value $value");

    RegExp regex = RegExp(r'(^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$)');
    if (value.isEmpty) {
      return 'Vui lòng nhập mật khẩu.';
    } else if (!regex.hasMatch(value)) {
      return "Mật khẩu phải có ít 8 kí tự kết hợp từ chữ và số.";
    }
    return null;
  }

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      print(emailController.text);
      print(passwordController.text);
      final data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      try {
        FullLoading.showDialog();

        final response = await authApi.register(data);
        FullLoading.cancelDialog();
        if (response.statusCode == 201) {
          final res = jsonDecode(response.body);
          print(res);
          CustomToast.showSuccess(
              Get.overlayContext!, res['message'].toString());

          TextEditingController().clear();
          Get.offAllNamed(Routes.login);
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } catch (e) {
        print(e.toString());
        CustomToast.showError(Get.overlayContext!, e.toString());
      }
    }
  }

  void loginWithGoogle() {
    final myController = Get.find<LoginController>(tag: "loginControllerTag");
    myController.loginWithGoogle();
  }
}
