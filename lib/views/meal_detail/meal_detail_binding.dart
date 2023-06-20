import 'package:get/get.dart';
import 'package:imiu_mobile/apis/meal_api.dart';
import 'package:imiu_mobile/controllers/meal_detail_controller.dart';

class MealDetailBinding implements Bindings {
  @override
  void dependencies() {
    print("binding");
    // Get.lazyPut<MealDetailController>(() => MealDetailController());
    Get.put(MealDetailController());
    Get.lazyPut(() => MealApi());
  }
}
