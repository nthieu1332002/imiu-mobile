import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/ultis/colors.dart';
import 'package:imiu_mobile/views/mainWrapper/main_wrapper_controller.dart';

class MainWrapper extends GetView<MainWrapperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBg,
        bottomNavigationBar: navBar(context),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.animateToTab,
          physics: const BouncingScrollPhysics(),
          children: [...controller.pages],
        ));
  }

  Widget navBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        child: Obx(() {
          final int currentPage = controller.currentPage.value;

          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavBarItem(
                  Icons.home_rounded,
                  'Home',
                  0,
                  currentPage,
                ),
                _buildNavBarItem(
                  Icons.restaurant_menu,
                  'Menu',
                  1,
                  currentPage,
                ),
                _buildNavBarItem(
                  Icons.bookmarks,
                  'Bookmarks',
                  2,
                  currentPage,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  GestureDetector _buildNavBarItem(
    IconData icon,
    String label,
    int index,
    int currentPage,
  ) {
    return GestureDetector(
      onTap: () => controller.goToPage(index),
      child: Column(
        children: [
          Icon(
            icon,
            size: 26,
            color: currentPage == index ? primaryColor : greyColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: currentPage == index ? primaryColor : greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
