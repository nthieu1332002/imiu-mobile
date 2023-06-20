import 'dart:convert';

import 'package:get/get.dart';
import 'package:imiu_mobile/apis/meal_api.dart';
import 'package:imiu_mobile/models/meal_detail.dart';

class MealDetailController extends GetxController {
  late String mealId;
  final mealDetail = Rx<MealDetail?>(null);
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    mealId = Get.arguments;
    getMealDetail();
    super.onInit();
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
