import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:imiu_mobile/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo-imiu.png', width: 350, height: 350),
        ],
      ),
    ));
  }
}
