part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const welcome = _Paths.welcome;
  static const register = _Paths.register;
  static const login = _Paths.login;
  static const subscription = _Paths.subscription;
  static const home = _Paths.home;
  static const payment = _Paths.payment;
  static const mealDetail = _Paths.mealDetail;
  // static const menu = _Paths.menu;
  // static const mark = _Paths.mark;
  // static const account = _Paths.account;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const subscription = '/subscription';
  static const payment = '/payment';
  static const mealDetail = '/meal-detail';

  // static const menu = '/menu';
  // static const mark = '/mark';
  // static const account = '/account';
}
