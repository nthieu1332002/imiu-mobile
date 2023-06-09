import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    print("bind");
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
