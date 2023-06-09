import 'package:get/get.dart';
import 'package:imiu_mobile/apis/payment_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var info = "".obs;
  var isLoading = true.obs;
  var payment = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    getQrCode(data);
  }

  Future<void> getQrCode(subId) async {
    final SharedPreferences prefs = await _prefs;
    final String? accountId = prefs.getString('accountId');
    final String? email = prefs.getString('email');
    print(email);
    info.value = email!;
    print("account:$accountId");
    final data = {"accountId": accountId, "subscriptionId": subId};
    try {
      isLoading(true);
      final response = await PaymentApi.getQrCode(data);
      final responseJson = response['data'];
      print("responseJson:$responseJson");
      payment.value = responseJson;
    } finally {
      isLoading(false);
    }
  }
}
