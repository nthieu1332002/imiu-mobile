import 'package:get/get.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    final SharedPreferences prefs = await _prefs;
    final String? accessToken = prefs.getString('accessToken');
    final bool? isVerified = prefs.getBool('isVerify');
    print(accessToken);
    print(isVerified);
    if (accessToken != null && accessToken.isNotEmpty && isVerified != null) {
      if (isVerified != null) {
        print('1');
        Future.delayed(
            const Duration(seconds: 3), () => Get.offAllNamed(Routes.home));
      } else {
        print('2');
        //return verify page
        Future.delayed(
            const Duration(seconds: 3), () => Get.offAllNamed(Routes.login));
      }
    } else {
      print('3');

      Future.delayed(
          const Duration(seconds: 3), () => Get.offAllNamed(Routes.login));
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
