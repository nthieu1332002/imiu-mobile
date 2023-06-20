import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imiu_mobile/ultis/colors.dart';

class ListItem extends StatelessWidget {
  final String img;
  final String name;
  final int duration;
  final int difficulty;
  final String calories;

  const ListItem(
      {super.key,
      required this.img,
      required this.name,
      required this.duration,
      required this.difficulty,
      required this.calories});

  @override
  Widget build(BuildContext context) {
    int maxLength = 20;
    String fName;
    if (name.length > maxLength) {
      fName = '${name.substring(0, maxLength)}...';
    } else {
      fName = name;
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Image.network(img),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 17, color: greyLightColor),
                SizedBox(width: 3),
                Text(
                  duration.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(width: 7),
                Icon(Icons.menu_book_outlined, size: 17, color: greyLightColor),
                SizedBox(width: 3),
                Text(
                  '$difficulty',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(width: 7),
                Icon(Icons.local_fire_department_outlined,
                    size: 17, color: greyLightColor),
                SizedBox(width: 3),
                Text(
                  calories,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
      Icon(Icons.arrow_forward_ios)
    ]);
  }
}
