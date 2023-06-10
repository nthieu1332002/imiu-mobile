import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/apis/auth_api.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_toast.dart';
import 'package:imiu_mobile/widgets/full_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthApi authApi = AuthApi();
  late TextEditingController emailController, passwordController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    print("loginFormKey: $loginFormKey");
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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      final data = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      try {
        FullLoading.showDialog();

        final response = await authApi.login(data);

        if (response.statusCode == 200) {
          final res = jsonDecode(response.body);
          if (res['data']['isVerify'] == true) {
            CustomToast.showSuccess(
                Get.overlayContext!, res['message'].toString());

            final SharedPreferences prefs = await _prefs;
            await Future.wait([
              prefs.setBool('isVerified', res['data']['isVerify']),
              prefs.setString('role', res['data']['role']),
              prefs.setString('accessToken', res['data']['accessToken']),
              prefs.setString('accountId', res['data']['accountId']),
              prefs.setString('email', res['data']['email']),
              prefs.setString(
                  'subscription', res['data']['subcription']?.toString() ?? ''),
            ]);
            TextEditingController().clear();
            if (res['data']['subsription'] ?? false) {
              Get.offAllNamed(Routes.home);
            }
            Get.offAllNamed(Routes.subscription);
          } else {
            throw jsonDecode(response.body)['message'];
          }
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } catch (e) {
        CustomToast.showError(Get.overlayContext!, e.toString());
      }
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      FullLoading.showDialog();
      final data = {'accessToken': googleAuth?.accessToken};
      final response = await authApi.loginWithGoogle(data);
      FullLoading.cancelDialog();
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['data']['isVerify'] == true) {
          CustomToast.showSuccess(
              Get.overlayContext!, res['message'].toString());
          final SharedPreferences prefs = await _prefs;
          await Future.wait([
            prefs.setBool('isVerified', res['data']['isVerify']),
            prefs.setString('role', res['data']['role']),
            prefs.setString('accessToken', res['data']['accessToken']),
            prefs.setString('accountId', res['data']['accountId']),
            prefs.setString('email', res['data']['email']),
            prefs.setString(
                'subscription', res['data']['subcription']?.toString() ?? ''),
          ]);
          if (res['data']['subsription'] ?? false) {
            Get.offAllNamed(Routes.home);
          }
          Get.offAllNamed(Routes.subscription);
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print(e.toString());
      CustomToast.showError(Get.overlayContext!, e.toString());
    }
  }
}
