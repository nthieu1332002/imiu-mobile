import 'package:get/get.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
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

  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('counter');
    Get.offAllNamed(Routes.login);
  }
}
