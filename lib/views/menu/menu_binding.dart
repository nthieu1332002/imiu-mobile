import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    print("bind");
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
  }
}
