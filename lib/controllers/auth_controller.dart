import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/apis/auth_api.dart';
import 'package:imiu_mobile/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthApi authApi = AuthApi();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AuthController(this.formKey);

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      try {
        final response = await authApi.login(data);
        if (response.statusCode == 200) {
          final res = jsonDecode(response.body);
          if (res['data']['isVerify'] == true) {
            CustomToast.showSuccess(
                Get.overlayContext!, res['message'].toString());

            final SharedPreferences prefs = await _prefs;
            await Future.wait([
              prefs.setString('accessToken', res['data']['accessToken']),
              prefs.setBool('isVerified', res['data']['isVerify']),
              prefs.setString('role', res['data']['role']),
              prefs.setString('subscription', res['data']['subcription'] ?? ''),
            ]);

            emailController.clear();
            passwordController.clear();
            // -> home
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

  Future<void> loginWithGoogle(token, email) async {
    try {
      print("ngu");
      print(token);
      final data = {'accessToken': token, 'email': email};
      final response = await authApi.loginWithGoogle(data);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        print(res);
        if (res['data']['isVerify'] == true) {
          CustomToast.showSuccess(
              Get.overlayContext!, res['message'].toString());
          print(res['message'].toString());
          // final SharedPreferences prefs = await _prefs;
          // await Future.wait([
          //   prefs.setString('accessToken', res['data']['accessToken']),
          //   prefs.setBool('isVerified', res['data']['isVerify']),
          //   prefs.setString('role', res['data']['role']),
          //   prefs.setString('subscription', res['data']['subcription'] ?? ''),
          // ]);

          // emailController.clear();
          // passwordController.clear();
          // -> home
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
