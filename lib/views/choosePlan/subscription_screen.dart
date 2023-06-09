import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/subscription_controller.dart';
import 'package:imiu_mobile/models/subscription.dart';
import 'package:imiu_mobile/ultis/colors.dart';
import 'package:imiu_mobile/views/payment/payment_screen.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class SubscriptionScreen extends StatelessWidget {
  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());

  SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // body: Center(
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            Color.fromARGB(255, 0, 108, 31),
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
                          return subscriptionCard(context,
                              subscriptionController.subscriptionList[index]);
                        }),
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 600,
                            viewportFraction: 0.82,
                            enlargeCenterPage: true));
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

  Widget subscriptionCard(context, Subscription subscription) {
    String value = subscription.value == 0
        ? "Free"
        : "${NumberFormat("#,###", "vi_VN").format(subscription.value).replaceAll(",", ".")}₫";
    return Container(
      width: 350,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              subscription.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subscription.duration,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: greyColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 36,
                  ),
                ),
                SizedBox(
                  width: 36,
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 36,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: subscription.subscriptionDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  bool status = subscription.subscriptionDetails[index].status;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        status
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : const Icon(Icons.cancel, color: Colors.red),
                        const SizedBox(width: 8),
                        Flexible(
                          child: SizedBox(
                            child: Text(
                              "${subscription.subscriptionDetails[index].detail}.",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: status ? null : greyColor,
                                  fontWeight: status ? FontWeight.bold : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Bắt đầu',
                onPressed: () {
                  Get.to(() => PaymentScreen(), arguments: subscription.id);
                  // Navigator.pushNamed(context, '/payment',
                  //     arguments: {'subId': subscription.id});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
