import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/apis/meal_api.dart';
import 'package:imiu_mobile/models/meal_detail.dart';

class MealDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  late String mealId;
  final mealDetail = Rx<MealDetail?>(null);
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    mealId = Get.arguments;
    getMealDetail();
    controller = TabController(vsync: this, length: 2);
  }

  void getMealDetail() async {
    try {
      isLoading(true);
      var meal = await MealApi.getMealDetail(mealId);
      mealDetail.value = meal;
      print(mealDetail.value);
    } catch (e) {
      isLoading(false);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
