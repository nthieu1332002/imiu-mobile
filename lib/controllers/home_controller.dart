import 'package:get/get.dart';
import 'package:imiu_mobile/apis/meal_api.dart';
import 'package:imiu_mobile/apis/tag_api.dart';
import 'package:imiu_mobile/models/meal.dart';
import 'package:imiu_mobile/models/tag.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var tagList = <Tag>[].obs;
  var mealList = <Meal>[].obs;
  var isLoading = true.obs;

  RxString email = "".obs;
  @override
  void onInit() async {
    // pageController = PageController(initialPage: 0);
    final SharedPreferences prefs = await _prefs;
    email.value = prefs.getString('email')!;
    getTagList();
    getMealList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getTagList() async {
    try {
      isLoading(true);
      var tag = await TagApi.getTags();
      tagList.value = tag;
    } finally {
      isLoading(false);
    }
  }

  void getMealList() async {
    try {
      isLoading(true);
      var meal = await MealApi.getMealList();
      mealList.value = meal;
    } finally {
      isLoading(false);
    }
  }
}
