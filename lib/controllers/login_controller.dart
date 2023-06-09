import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/apis/auth_api.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_toast.dart';
import 'package:imiu_mobile/widgets/full_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthApi authApi = AuthApi();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginController(this.formKey);
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final data = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      try {
        FullLoading.showDialog();

        final response = await authApi.login(data);
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

            TextEditingController().clear();
            Get.offAllNamed(Routes.home);
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

  Future<void> loginWithGoogle(token) async {
    try {
      FullLoading.showDialog();
      final data = {'accessToken': token};
      final response = await authApi.loginWithGoogle(data);
      FullLoading.cancelDialog();
      print(response);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        print(res);
        if (res['data']['isVerify'] == true) {
          CustomToast.showSuccess(
              Get.overlayContext!, res['message'].toString());
          final SharedPreferences prefs = await _prefs;
          await Future.wait([
            prefs.setBool('isVerified', res['data']['isVerify']),
            prefs.setString('role', res['data']['role']),
            prefs.setString('accessToken', res['data']['accessToken']),
            prefs.setString('accountId', res['data']['accountId']),
            prefs.setString(
                'name', res['data']['name'] ?? res['data']['email']),
            // prefs.setString('subscription',
            //     res['data']['subcription']['name']?.toString() ?? ''),
          ]);
          // -> checking here
          // Get.offAllNamed(Routes.home);
          // String subscription =
          //     res['data']['subscription']['name']?.toString() ?? '';
          Get.offAllNamed(Routes.subscription);
          // if (subscription == "") {
          // } else {
          //   Get.offAllNamed(Routes.home);
          // }
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
