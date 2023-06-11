import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/home_controller.dart';
import 'package:imiu_mobile/ultis/colors.dart';

class HomeScreen extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xin chào,',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: greyColor),
                ),
                Text(controller.email.value,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                SearchBar(
                  hintText: "Hôm nay, bạn muốn ăn gì ?",
                  // controller: controller,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 15)),
                  leading: const Icon(Icons.search),
                ),
              ],
            )),
      ),
    ));
  }
}
