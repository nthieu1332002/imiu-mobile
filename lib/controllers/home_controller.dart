import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxString email = "".obs;
  @override
  void onInit() async {
    // pageController = PageController(initialPage: 0);
    final SharedPreferences prefs = await _prefs;
    email.value = prefs.getString('email')!;
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

  // logout() async {
  //   final SharedPreferences prefs = await _prefs;
  //   prefs.remove('counter');
  //   Get.offAllNamed(Routes.login);
  // }
}
