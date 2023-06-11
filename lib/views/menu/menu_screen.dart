import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    print("screen");
    return const Scaffold(
      body: Center(child: Text('menu')),
    );
  }
}
