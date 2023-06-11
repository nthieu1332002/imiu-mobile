import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/mark_controller.dart';

class MarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarkController>(
      () => MarkController(),
    );
  }
}
