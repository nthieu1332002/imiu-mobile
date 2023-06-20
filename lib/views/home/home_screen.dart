import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/home_controller.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/ultis/colors.dart';
import 'package:imiu_mobile/widgets/list_item.dart';

class HomeScreen extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  final List<String> imgList = [
    'assets/images/imiu-home-banner.png',
    'assets/images/imiu-home-banner-1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBg,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Xin chào,',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: greyColor),
                    ),
                    Text(controller.email.value,
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    SearchBar(
                      // controller: controller,
                      hintText: "Hôm nay, bạn muốn ăn gì ?",
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(horizontal: 15)),
                      leading: const Icon(Icons.search, color: primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Row(children: [
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.tagList.length,
                                  itemBuilder: (context, index) {
                                    final tag = controller.tagList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: greyColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: primaryBg),
                                          child: Center(
                                              child: Text(
                                            tag.name,
                                            style: const TextStyle(
                                                fontSize: 17, color: greyColor),
                                          ))),
                                    );
                                  }),
                            )
                          ]);
                        }
                      }),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                      ),
                      items: imgList
                          .map((item) => Image.asset(item,
                              width: MediaQuery.of(context).size.width))
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    Text("Gợi ý dành cho bạn",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 10),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.mealList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final meal = controller.mealList[index];
                          return GestureDetector(
                            onTap: () => (Get.toNamed(Routes.mealDetail,
                                arguments: meal.id)),
                            child: ListItem(
                              calories: meal.calories,
                              difficulty: meal.difficulty,
                              duration: meal.cookingTime,
                              img: meal.imageUrl,
                              name: meal.name,
                            ),
                          );
                        }),
                  ],
                )),
          ),
        ));
  }
}
