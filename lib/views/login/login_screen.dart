import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/login_controller.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ultis/colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/logo-imiu.png'),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Welcome back!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập email.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập mật khẩu.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Mật khẩu",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      text: 'Đăng nhập',
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Hoặc',
                      style: TextStyle(
                        color: Color(0xFF7B868C),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.loginWithGoogle();
                      },
                      icon: const Icon(FontAwesomeIcons.google,
                          color: Colors.black),
                      label: const Text('Đăng nhập với Google',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // change the button color here
                        minimumSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      'Chưa có tài khoản?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.register);
                      },
                      child: const Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
