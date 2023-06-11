import 'package:get/get.dart';
import 'package:imiu_mobile/views/mainWrapper/main_wrapper_controller.dart';

class MainWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainWrapperController>(
      MainWrapperController(),
    );
  }
}
