import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/ultis/colors.dart';
import 'package:imiu_mobile/views/mainWrapper/main_wrapper_controller.dart';

class MainWrapper extends GetView<MainWrapperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: navBar(context),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.animateToTab,
          physics: const BouncingScrollPhysics(),
          children: [...controller.pages],
        ));
  }

  Container navBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: navBg, borderRadius: BorderRadius.circular(25)),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        controller.goToPage(0);
                      },
                      icon: controller.currentPage == 0
                          ? const Icon(
                              Icons.home_rounded,
                              color: primaryColor,
                              size: 27,
                            )
                          : const Icon(
                              Icons.home_rounded,
                              color: greyColor,
                              size: 25,
                            )),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    controller.goToPage(1);
                  },
                  icon: controller.currentPage == 1
                      ? const Icon(
                          Icons.restaurant_menu,
                          color: primaryColor,
                          size: 27,
                        )
                      : const Icon(
                          Icons.restaurant_menu,
                          color: greyColor,
                          size: 25,
                        ),
                ),
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.goToPage(2);
                    },
                    icon: controller.currentPage == 2
                        ? const Icon(
                            Icons.bookmarks,
                            color: primaryColor,
                            size: 27,
                          )
                        : const Icon(
                            Icons.bookmarks,
                            color: greyColor,
                            size: 25,
                          )),
                // IconButton(
                // splashColor: Colors.transparent,
                //   highlightColor: Colors.transparent,
                //     enableFeedback: false,
                //     onPressed: () {
                //       controller.goToPage(3);
                //     },
                //     icon: const Icon(
                //       Icons.person,
                //       color: primaryColor,
                //       size: 25,
                //     )),
              ],
            ),
          )),
    );
  }
}
