part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const register = _Paths.register;
  static const login = _Paths.login;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
}
