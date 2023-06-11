import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/register_controller.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ultis/colors.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: controller.registerFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'Tạo tài khoản với ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                            children: [
                              TextSpan(
                                  text: 'IMiU',
                                  style: TextStyle(
                                    color: primaryColor,
                                  )),
                              TextSpan(
                                text: ' nào',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validateEmail(value!);
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
                            return controller.validatePassword(value!);
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
                            text: 'Đăng ký',
                            onPressed: () {
                              controller.register();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Hoặc',
                            style: TextStyle(
                              color: greyColor,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Đã có tài khoản?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed(Routes.login);
                                },
                                child: const Text(
                                  'Đăng nhập ngay',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/images/imiu-login.png',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
