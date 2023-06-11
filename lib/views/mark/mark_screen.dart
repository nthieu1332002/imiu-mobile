import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/mark_controller.dart';

class MarkScreen extends GetView<MarkController> {
  const MarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('mark')),
    );
  }
}
