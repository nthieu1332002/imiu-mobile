import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/subscription_controller.dart';
import 'package:imiu_mobile/models/subscription.dart';
import 'package:imiu_mobile/ultis/colors.dart';

class SubscriptionScreen extends StatelessWidget {
  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());

  SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(subscriptionController.subscriptionList);
    // body: Center(
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primaryColor,
            Colors.greenAccent,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                const Text(
                  'Chọn gói phù hợp với bạn',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (subscriptionController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return CarouselSlider.builder(
                        itemCount:
                            subscriptionController.subscriptionList.length,
                        itemBuilder: ((context, index, realIndex) {
                          return subscriptionCard(
                              subscriptionController.subscriptionList[index]);
                        }),
                        options: CarouselOptions(height: 500.0));
                  }
                })
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }

  Widget subscriptionCard(Subscription subscriptionList) => Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 5),
      );
}
