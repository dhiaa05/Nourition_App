import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';

import 'categorieFood.dart';

// SingleChildScrollView categorieList() {
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CategorieFood(
//           title: "Dinner",
//           isActive: true,
//           press: () {},
//         ),
//         CategorieFood(
//           title: "Breakfast",
//           press: () {},
//         ),
//         CategorieFood(
//           title: "Salad",
//           press: () {},
//         ),
//         CategorieFood(
//           title: "Snacks & Salades",
//           press: () {},
//         ),
//       ],
//     ),
//   );
// }

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<String> categories = ["Dinner", "Breakfast", "Salad", "Fruits"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildCategories(index),
        itemCount: categories.length,
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 3,
              width: 30,
              color:
                  selectedIndex == index ? kPrimaryColor : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
