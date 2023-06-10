import 'dart:convert';

import 'package:get/get.dart';
import 'package:imiu_mobile/apis/payment_api.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/widgets/custom_toast.dart';
import 'package:imiu_mobile/widgets/full_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var info = "".obs;
  var payment = {}.obs;
  late String subId;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    subId = Get.arguments;
    getQrCode();
  }

  Future<void> getQrCode() async {
    final SharedPreferences prefs = await _prefs;
    final String? accountId = prefs.getString('accountId');
    final String? email = prefs.getString('email');
    info.value = email!;
    final data = {"accountId": accountId, "subscriptionId": subId};
    print(subId);

    try {
      FullLoading.showDialog();

      final response = await PaymentApi.getQrCode(data);
      if (response.statusCode == 201) {
        final res = jsonDecode(response.body);
        print("res: $res");
        // final responseJson =
        payment.value = res['data'];
      }
    } finally {
      isLoading(false);
      FullLoading.cancelDialog();
    }
  }

  Future<void> plans() async {
    final SharedPreferences prefs = await _prefs;
    final String? accountId = prefs.getString('accountId');
    final String? email = prefs.getString('email');
    info.value = email!;
    print(accountId);
    print(subId);
    print(payment['transactionCode']);
    final data = {
      "accountId": accountId,
      "subscriptionId": subId,
      "transactionCode": payment['transactionCode'],
    };
    try {
      FullLoading.showDialog();

      final response = await PaymentApi.plans(data);
      print(response.statusCode);
      if (response.statusCode == 201) {
        final res = jsonDecode(response.body);
        CustomToast.showSuccess(Get.overlayContext!, res['message'].toString());
        Get.offAllNamed(Routes.home);
      } else {
        CustomToast.showError(Get.overlayContext!, 'Đăng kí gói thất bại!');
      }
    } finally {
      FullLoading.cancelDialog();
    }
  }
}
