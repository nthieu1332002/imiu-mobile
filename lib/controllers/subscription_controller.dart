import 'dart:convert';

import 'package:get/get.dart';
import 'package:imiu_mobile/apis/subscription_api.dart';
import 'package:imiu_mobile/models/subscription.dart';

class SubscriptionController extends GetxController {
  var subscriptionList = <Subscription>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("call init");
    getSubScriptions();
  }

  void getSubScriptions() async {
    print("call sub api");
    try {
      isLoading(true);
      var subscriptions = await SubscriptionApi.getSubScriptions();
      subscriptionList.value = subscriptions;
      var js = subscriptionToJson(subscriptionList);
      print("subscriptionLít: $js");
    } finally {
      isLoading(false);
    }
  }
}
