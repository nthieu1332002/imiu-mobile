import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/views/home/home_screen.dart';
import 'package:imiu_mobile/views/mark/mark_screen.dart';
import 'package:imiu_mobile/views/menu/menu_screen.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    HomeScreen(),
    MenuScreen(),
    MarkScreen(),
    // const ProfileTab(),
  ];
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void goToPage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
    print(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    print(page);
  }
}
