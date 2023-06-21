import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/meal_detail_controller.dart';
import 'package:imiu_mobile/models/meal_detail.dart';
import 'package:imiu_mobile/ultis/colors.dart';

class MealDetailScreen extends GetView<MealDetailController> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          final item = controller.mealDetail.value;
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(item!.imageUrl),
                ),
                buttonArrow(),
                scroll(item)
              ],
            );
          }
        }),
      ),
    );
  }
}

buttonArrow() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}

scroll(MealDetail? item) {
  int maxLength = 25;
  String fName;
  if (item!.name.length > maxLength) {
    fName = '${item.name.substring(0, maxLength)}...';
  } else {
    fName = item.name;
  }
  String summary;
  if (item.summary.length > 200) {
    summary = '${item.summary.substring(0, 200)}...';
  } else {
    summary = item.summary;
  }
  String difficulty;
  var calories = item.nutritionFacts.firstWhere((e) => e.name == "Calories");

  switch (item.difficulty) {
    case 1:
      difficulty = 'Dễ';
      break;
    case 2:
      difficulty = 'Vừa';
      break;
    case 3:
      difficulty = 'Khó';
      break;
    default:
      difficulty = 'Dễ';
  }

  return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: mainBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ],
                    ),
                  ),
                  Text(fName, style: Theme.of(context).textTheme.displayLarge),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined,
                          size: 20, color: greyLightColor),
                      SizedBox(width: 3),
                      Text(
                        item.cookingTime.toString() + ' \'',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.menu_book_outlined,
                          size: 20, color: greyLightColor),
                      SizedBox(width: 3),
                      Text(
                        difficulty,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.local_fire_department_outlined,
                          size: 20, color: greyLightColor),
                      SizedBox(width: 3),
                      Text(
                        calories.value.toString() + " " + calories.code,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text('Chi tiết',
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 10),
                  Text(summary,
                      style: Theme.of(context).textTheme.displaySmall),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text('Giá trị dinh dưỡng',
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 10),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: item.nutritionFacts.length,
                      itemBuilder: (context, index) {
                        return nutrition(item.nutritionFacts[index]);
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text('Nguyên liệu',
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 10),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: item.mealIngredients.length,
                      itemBuilder: (context, index) {
                        return ingredients(item.mealIngredients[index]);
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text('Các bước tiến hành',
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 10),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: item.directions.length,
                      itemBuilder: (context, index) {
                        return step(item.directions[index], index);
                      }),
                ],
              ),
            ));
      });
}

nutrition(NutritionFact item) {
  String name =
      item.name[0].toUpperCase() + item.name.substring(1).toLowerCase();
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
          Text.rich(
            style: TextStyle(fontWeight: FontWeight.w500),
            TextSpan(
                text: item.value.toString() + " ",
                children: [TextSpan(text: item.code)]),
          ),
        ],
      ));
}

ingredients(MealIngredient item) {
  String name =
      item.name[0].toUpperCase() + item.name.substring(1).toLowerCase();
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: secondColor,
                child: Icon(Icons.done, size: 17, color: primaryColor),
              ),
              SizedBox(width: 10),
              Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Text.rich(
            style: TextStyle(fontWeight: FontWeight.w500),
            TextSpan(
                text: item.quantity.toString() + " ",
                children: [TextSpan(text: item.unit)]),
          ),
        ],
      ));
}

step(Direction direction, index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundColor: secondColor,
          radius: 12,
          child: Text("${index + 1}"),
        ),
        SizedBox(
          width: 280,
          child: Text(
            direction.instruction,
          ),
        ),
      ],
    ),
  );
}
