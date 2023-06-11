import 'package:get/get.dart';
import 'package:imiu_mobile/models/welcome.dart';
import 'package:imiu_mobile/views/choosePlan/subscription_binding.dart';
import 'package:imiu_mobile/views/choosePlan/subscription_screen.dart';
import 'package:imiu_mobile/views/home/home_binding.dart';
import 'package:imiu_mobile/views/login/login_binding.dart';
import 'package:imiu_mobile/views/login/login_screen.dart';
import 'package:imiu_mobile/views/mainWrapper/main_wrapper.dart';
import 'package:imiu_mobile/views/mainWrapper/main_wrapper_binding.dart';
import 'package:imiu_mobile/views/mark/mark_binding.dart';
import 'package:imiu_mobile/views/mark/mark_screen.dart';
import 'package:imiu_mobile/views/menu/menu_binding.dart';
import 'package:imiu_mobile/views/menu/menu_screen.dart';
import 'package:imiu_mobile/views/register/register_binding.dart';
import 'package:imiu_mobile/views/register/register_screen.dart';
import 'package:imiu_mobile/views/home/home_screen.dart';
import 'package:imiu_mobile/views/payment/payment_binding.dart';
import 'package:imiu_mobile/views/payment/payment_screen.dart';
import 'package:imiu_mobile/views/splash/splash_binding.dart';
import 'package:imiu_mobile/views/splash/splash_screen.dart';
import 'package:imiu_mobile/views/welcome/welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.welcome;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomeScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => MainWrapper(),
      binding: MainWrapperBinding(),
    ),
    GetPage(
      name: _Paths.subscription,
      page: () => SubscriptionScreen(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.payment,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
    ),
    // GetPage(
    //   name: _Paths.menu,
    //   page: () => MenuScreen(),
    //   binding: MenuBinding(),
    // ),
    // GetPage(
    //   name: _Paths.mark,
    //   page: () => const MarkScreen(),
    //   binding: MarkBinding(),
    // )
  ];
}
